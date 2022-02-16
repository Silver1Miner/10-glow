extends Area2D

export var id := 0
export var query: String = "Use Elevator?"
onready var transition = $"../GUI/Transition"

func get_query() -> String:
	return query

func use_elevator(floor_number: int) -> void:
	PlayerData.current_floor = floor_number
	PlayerData.mind_side = false
	if transition:
		transition.transition_to(PlayerData.floors[floor_number])
	#if get_tree().change_scene_to(PlayerData.floors[floor_number]) != OK:
	#	push_error("failed to change scene")


func _on_Elevator_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		$AnimationPlayer.play("OPEN")


func _on_Elevator_area_exited(area: Area2D) -> void:
	if area.is_in_group("player"):
		$AnimationPlayer.play_backwards("OPEN")
