extends Area2D

export var next_scene: String
export var query: String = "Enter MIND ROOM?"
onready var transition = $"../GUI/Transition"

func get_query() -> String:
	return query

func physical_exit() -> void:
	if transition:
		AudioManager.play_sound(1)
		transition.transition_to(PlayerData.mind_room)
	#if get_tree().change_scene(next_scene) != OK:
	#	push_error("failed to change scene")

func _on_PhysicalExit_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		$Sprite.self_modulate = Color(1.2,1.2,1.2)

func _on_PhysicalExit_area_exited(area: Area2D) -> void:
	if area.is_in_group("player"):
		$Sprite.self_modulate = Color(1,1,1,1)
