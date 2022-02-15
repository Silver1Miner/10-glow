extends Node2D

onready var decorations = $Decorations

func _ready() -> void:
	$GUI/InventoryView.visible = false
	if len(PlayerData.decorations) > 0:
		load_decorations()
	for d in decorations.get_children():
		if d.connect("decoration_updated", self, "update_mind_rating") != OK:
			push_error("decoration connect fail")
	update_mind_rating()

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

func update_mind_rating() -> void:
	var sum = 0
	for d in decorations.get_children():
		sum += d.get_decoration_rating()
	PlayerData.corruption = sum
	$GUI/MindRating.text = "Corruption:" + str(PlayerData.corruption)
