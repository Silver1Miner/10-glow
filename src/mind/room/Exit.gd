extends StaticBody2D

export var next_scene: String
export var query: String = "Exit mind space?"

func _ready() -> void:
	pass

func get_query() -> String:
	return query

func exit() -> void:
	if get_tree().change_scene(next_scene) != OK:
		push_error("failed to change scene")
