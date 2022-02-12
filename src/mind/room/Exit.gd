extends StaticBody2D

signal exit_used()
export var query: String = "Exit mind space?"

func _ready() -> void:
	pass

func get_query() -> String:
	return query

func exit() -> void:
	emit_signal("exit_used")
	PlayerData.mind_side = true
	if get_tree().change_scene_to(PlayerData.floors[PlayerData.current_floor]) != OK:
		push_error("failed to change scene")
