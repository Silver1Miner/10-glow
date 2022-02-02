extends KinematicBody2D

export var grid: Resource = preload("res://src/world/Grid.tres")
export var cell := Vector2.ZERO setget set_cell
export var ui_cooldown := 0.1
onready var _timer: Timer = $Timer

func _ready() -> void:
	_timer.wait_time = ui_cooldown
	set_cell(grid.get_cell_coordinates(position))
	position = grid.get_map_position(cell)

func set_cell(input: Vector2) -> void:
	var new_cell: Vector2 = grid.clamp_to_board(input)
	if new_cell.is_equal_approx(cell):
		return
	cell = new_cell
	position = grid.get_map_position(cell)

func _unhandled_input(event) -> void:
	var should_move = event.is_pressed()
	if event.is_echo():
		should_move = should_move and _timer.is_stopped()
	if not should_move:
		return
	if event.is_action("ui_right"):
		self.cell += Vector2.RIGHT
	elif event.is_action("ui_left"):
		self.cell += Vector2.LEFT
	if event.is_action("ui_up"):
		self.cell += Vector2.UP
	elif event.is_action("ui_down"):
		self.cell += Vector2.DOWN
