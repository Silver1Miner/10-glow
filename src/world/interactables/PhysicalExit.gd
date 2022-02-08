extends Area2D

export var next_scene: String
export var query: String = "Enter mind space?"

func get_query() -> String:
	return query

func physical_exit() -> void:
	if get_tree().change_scene(next_scene) != OK:
		push_error("failed to change scene")
