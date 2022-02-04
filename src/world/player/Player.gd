extends Node2D

export var grid: Resource = preload("res://src/world/Grid.tres")
export var ui_cooldown := 0.1
onready var _timer: Timer = $Timer
onready var _ray: RayCast2D = $RayCast2D

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
	elif _ray.get_collider().has_method("interact"):
		_ray.get_collider().interact()
	cell = grid.get_cell_coordinates(position)

func interact() -> void:
	_ray.force_raycast_update()
	if _ray.is_colliding() and _ray.get_collider().has_method("interact"):
		_ray.get_collider().interact()
	else:
		print("nothing to interact with")
