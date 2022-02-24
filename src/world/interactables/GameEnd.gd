extends Area2D

export var corruption_cutoff = 0
export var next_scene: String
export var query: String = "Leave?"
onready var transition = $"../GUI/Transition"

func _ready() -> void:
	visible = PlayerData.corruption >= corruption_cutoff

func get_query() -> String:
	return query

func physical_exit() -> void:
	if transition:
		transition.transition_to(PlayerData.ending)

func _on_GameEnd_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		$Sprite2.self_modulate = Color(1.2,1.2,1.2)\

func _on_GameEnd_area_exited(area: Area2D) -> void:
	if area.is_in_group("player"):
		$Sprite2.self_modulate = Color(1,1,1,1)
