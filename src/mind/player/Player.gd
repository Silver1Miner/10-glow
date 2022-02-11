extends Node2D

export var grid: Resource = preload("res://src/data/Grid.tres")
export var data: Resource = load("res://src/data/DataResource.tres")
export var ui_cooldown := 0.05
onready var _timer: Timer = $Timer
onready var _ray: RayCast2D = $RayCast2D
onready var interface = $"../GUI/UI"
onready var itemlist = $"../GUI/UI/ItemList"
onready var textbox = $"../GUI/UI/Textbox"

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
	_ray.cast_to = inputs[dir] * tile_size
	_ray.force_raycast_update()
	if !_ray.is_colliding():
		position += inputs[dir] * tile_size
	else:
		interact()
	cell = grid.get_cell_coordinates(position)
	_timer.start()

func interact() -> void:
	_ray.force_raycast_update()
	if _ray.is_colliding() and _ray.get_collider().has_method("exit"):
		current_target = _ray.get_collider()
		var query = _ray.get_collider().get_query()
		interface.populate_item_list(data.choice)
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
			if dec["name"] in PlayerData.inventory:
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
