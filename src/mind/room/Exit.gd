extends Area2D

signal exit_used()
export var query: String = "Exit MIND ROOM?"
onready var transition = $"../GUI/Transition"

func get_query() -> String:
	return query

func exit() -> void:
	emit_signal("exit_used")
	PlayerData.mind_side = true
	if transition:
		AudioManager.play_sound(2)
		transition.transition_to(PlayerData.floors[PlayerData.current_floor])
	#if get_tree().change_scene_to(PlayerData.floors[PlayerData.current_floor]) != OK:
	#	push_error("failed to change scene")
