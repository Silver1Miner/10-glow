extends Area2D

export var ending = 0
export var corruption_cutoff = 0
export var next_scene: String
export var query: String = "Leave?"
onready var transition = $"../GUI/Transition"
export var deactivated = true

func _ready() -> void:
	deactivated = PlayerData.floors_unlocked < 5

func get_query() -> String:
	return query

func physical_exit() -> void:
	if transition:
		PlayerData.ending = ending
		transition.transition_to(PlayerData.ending_scene)

func _on_GameEnd_area_entered(area: Area2D) -> void:
	if area.is_in_group("player") and not deactivated:
		$Sprite2.self_modulate = Color(1.2,1.2,1.2)\

func _on_GameEnd_area_exited(area: Area2D) -> void:
	if area.is_in_group("player") and not deactivated:
		$Sprite2.self_modulate = Color(1,1,1,1)
