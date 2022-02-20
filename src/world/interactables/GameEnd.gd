extends Area2D

export var corruption_cutoff = 0
export var next_scene: String
export var query: String = "Leave?"
onready var transition = $"../GUI/Transition"

func _ready() -> void:
	visible = PlayerData.corruption > corruption_cutoff

func get_query() -> String:
	return query

func physical_exit() -> void:
	if transition:
		transition.transition_to(PlayerData.text_scroll)
