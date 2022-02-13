extends Area2D

export var next_scene: String
export var query: String = "Enter mind space?"
onready var transition = $"../GUI/Transition"

func get_query() -> String:
	return query

func physical_exit() -> void:
	if transition:
		transition.transition_to(PlayerData.mind_room)
	#if get_tree().change_scene(next_scene) != OK:
	#	push_error("failed to change scene")
