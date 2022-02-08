extends Node2D

onready var decorations = $Decorations

func _ready() -> void:
	if len(PlayerData.decorations) > 0:
		load_decorations()

func _on_Exit_exit_used() -> void:
	save_decorations()

func load_decorations() -> void:
	for d in decorations.get_children():
		d.load_serialized(PlayerData.decorations[d.decoration_id])
	print(PlayerData.decorations)

func save_decorations() -> void:
	var serialized := {}
	for d in decorations.get_children():
		serialized[d.decoration_id] = d.serialize_state()
	PlayerData.decorations = serialized.duplicate(true)
	print(PlayerData.decorations)
