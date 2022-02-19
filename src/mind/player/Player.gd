extends Node2D

export var grid: Resource = preload("res://src/data/Grid.tres")
export var data: Resource = load("res://src/data/DataResource.tres")
export var ui_cooldown := 0.4
onready var _timer: Timer = $Timer
onready var _ray: RayCast2D = $RayCast2D
onready var _tween: Tween = $Tween
onready var interface = $"../GUI/UI"
onready var itemlist = $"../GUI/UI/ItemList"
onready var textbox = $"../GUI/UI/Textbox"

var left = true
var current_target = null
var cell := Vector2.ZERO
var tile_size = 32
var inputs = {
	"ui_right": Vector2.RIGHT, "ui_left": Vector2.LEFT,
	"ui_up": Vector2.UP, "ui_down": Vector2.DOWN
}
var player_has = []

func _ready() -> void:
	_timer.wait_time = ui_cooldown
	position = position.snapped(Vector2.ONE * tile_size)
	cell = grid.get_cell_coordinates(position)
	if interface and interface.connect("item_activated", self, "_on_item_activated") != OK:
		push_error("UI selection connect fail")

func _unhandled_input(event) -> void:
	var should_move = event.is_pressed()
	if event.is_echo():
		should_move = should_move and _timer.is_stopped()
	if not should_move:
		return
	for dir in inputs.keys():
		if event.is_action(dir):
			move(dir)
	if event.is_action_pressed("ui_select") or event.is_action_pressed("ui_accept"):
		interact()

func move(dir) -> void:
	match inputs[dir]:
		Vector2.UP:
			$Sprite.frame = 1
		Vector2.DOWN:
			$Sprite.frame = 8
		Vector2.LEFT:
			$Sprite.frame = 5
		Vector2.RIGHT:
			$Sprite.frame = 12
	_ray.cast_to = inputs[dir] * tile_size
	_ray.force_raycast_update()
	if !_ray.is_colliding():
		move_tween(dir)
	else:
		interact()
	cell = grid.get_cell_coordinates(position)
	_timer.start()

func move_tween(dir) -> void:
	if not _tween.interpolate_property(self, "position",
	position, position + inputs[dir] * tile_size,
	0.4, Tween.TRANS_QUART, Tween.EASE_IN_OUT):
		push_error("tween did not interpolate property")
	if not _tween.start():
		push_error("tween did not start")
	match inputs[dir]:
		Vector2.DOWN:
			if left:
				$AnimationPlayer.play("walk_down")
				left = false
			else:
				$AnimationPlayer.play("walk_down_2")
				left = true
		Vector2.UP:
			if left:
				$AnimationPlayer.play("walk_up")
				left = false
			else:
				$AnimationPlayer.play("walk_up_2")
				left = true
		Vector2.LEFT:
			if left:
				$AnimationPlayer.play("walk_left")
				left = false
			else:
				$AnimationPlayer.play("walk_left_2")
				left = true
		Vector2.RIGHT:
			if left:
				$AnimationPlayer.play("walk_right")
				left = false
			else:
				$AnimationPlayer.play("walk_right_2")
				left = true

func interact() -> void:
	_ray.force_raycast_update()
	if _ray.is_colliding() and _ray.get_collider().has_method("exit"):
		current_target = _ray.get_collider()
		var query = _ray.get_collider().get_query()
		interface.populate_item_list(PlayerData.choice)
		itemlist.visible = true
		interface.visible = true
		itemlist.select(0)
		textbox.play_dialogue({"0": {"name":"", "profile":"",
		"text":query}})
		itemlist.grab_focus()
	elif _ray.is_colliding() and _ray.get_collider().has_method("interact"):
		current_target = _ray.get_collider()
		var type = current_target.get_decoration_type()
		player_has.clear()
		for dec in data.decorations[type]:
			if dec["name"] in PlayerData.mind_inventory:
				player_has.append(dec)
		interface.populate_item_list(player_has)
		itemlist.visible = true
		interface.visible = true
		itemlist.select(0)
		textbox.play_dialogue({"0": {"name":"", "profile":"",
		"text":"Change decoration?"}})
		itemlist.grab_focus()
	else:
		current_target = null
		print("nothing to interact with")

func _on_item_activated(index) -> void:
	if current_target and current_target.has_method("change_decoration"):
		current_target.change_decoration(player_has[index-1]["id"])
		interface.visible = false
	elif index == 1 and current_target and current_target.has_method("exit"):
		print(index)
		current_target.exit()
		interface.visible = false
