extends Node2D

export var data: Resource = preload("res://src/data/DataResource.tres")

func _ready() -> void:
	$GUI/Transition.visible = true
	$GUI/InventoryView.visible = true
	for inter in $Interactables.get_children():
		if inter.readable:
			inter.connect("read_interactable", self, "on_read_interactable")
	for chars in $Characters.get_children():
		chars.connect("play_conversation", self, "on_play_conversation")
	if PlayerData.new_game:
		PlayerData.new_game = false
	elif PlayerData.mind_side:
		$PhysicalPlayer.position.x = $MindExit.position.x
	else:
		$PhysicalPlayer.position.x = $Elevator.position.x - 164
		$PhysicalPlayer/Sprite.flip_h = true

func on_read_interactable(read_id):
	$GUI/Message/Text.text = data.readings[read_id]
	$GUI/Message.visible = true

func on_play_conversation(converse_id):
	converse_key = converse_id
	$GUI/UI/Textbox.play_dialogue(data.conversations[converse_id])

var converse_key = -1
func _on_Textbox_text_finished() -> void:
	if converse_key in data.key_conversations:
		PlayerData.floors_unlocked = int(max(PlayerData.floors_unlocked, data.key_conversations[converse_key]))
		$GUI/InventoryView.update_inventory_view()
	converse_key = -1
