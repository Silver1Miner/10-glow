extends Node2D

export var grid: Resource = preload("res://src/data/Grid.tres")
export var data: Resource = preload("res://src/data/DataResource.tres")
export var ui_cooldown := 0.1
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

func _ready() -> void:
	_timer.wait_time = ui_cooldown
	position = position.snapped(Vector2.ONE * tile_size)
	cell = grid.get_cell_coordinates(position)
	if interface.connect("item_activated", self, "_on_item_activated") != OK:
		push_error("UI selection connect fail")

func _unhandled_input(event) -> void:
	var should_move = event.is_pressed()
	if event.is_echo():
		should_move = should_move and _timer.is_stopped()
	if not should_move:
		return
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)
	if event.is_action_pressed("ui_select"):
		interact()

func move(dir) -> void:
	_ray.cast_to = inputs[dir] * tile_size
	_ray.force_raycast_update()
	if !_ray.is_colliding():
		position += inputs[dir] * tile_size
	else:
		interact()
	cell = grid.get_cell_coordinates(position)

func interact() -> void:
	_ray.force_raycast_update()
	if _ray.is_colliding() and _ray.get_collider().has_method("exit"):
		current_target = _ray.get_collider()
		var query = _ray.get_collider().get_query()
		interface.populate_item_list(data.choice)
		itemlist.visible = true
		interface.visible = true
		itemlist.select(0)
		itemlist.grab_focus()
		textbox.play_dialogue({"0": {"name":"", "profile":"",
		"text":query}})
	elif _ray.is_colliding() and _ray.get_collider().has_method("interact"):
		current_target = _ray.get_collider()
		var type = current_target.get_decoration_type()
		interface.populate_item_list(data.decorations[type])
		itemlist.visible = true
		interface.visible = true
		itemlist.select(0)
		itemlist.grab_focus()
		textbox.play_dialogue({"0": {"name":"", "profile":"",
		"text":"Change decoration?"}})
	else:
		current_target = null
		print("nothing to interact with")

func _on_item_activated(index) -> void:
	if current_target and current_target.has_method("change_decoration"):
		current_target.change_decoration(index-1)
		interface.visible = false
	elif index == 1 and current_target and current_target.has_method("exit"):
		print(index)
		current_target.exit()
		interface.visible = false
