extends Node2D

export var data: Resource = preload("res://src/data/DataResource.tres")

func _ready() -> void:
	for inter in $Interactables.get_children():
		if inter.readable:
			inter.connect("read_interactable", self, "on_read_interactable")
	for chars in $Characters.get_children():
		chars.connect("play_conversation", self, "on_play_conversation")
	if PlayerData.mind_side:
		$PhysicalPlayer.position.x = $MindExit.position.x
	else:
		$PhysicalPlayer.position.x = $Elevator.position.x

func on_read_interactable(read_id):
	$GUI/Message/Text.text = data.readings[read_id]
	$GUI/Message.visible = true

func on_play_conversation(converse_id):
	print(converse_id)
	$GUI/UI/Textbox.play_dialogue(data.conversations[converse_id])
