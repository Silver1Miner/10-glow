extends Node2D

export var data: Resource = preload("res://src/data/DataResource.tres")
export var bot_cutoff = 45
export var top_cutoff = 80
export var gnome_cutoff = 4

func _ready() -> void:
	randomize()
	$Gnomer.visible = rand_range(1,10) > gnome_cutoff
	if PlayerData.corruption > bot_cutoff:
		AudioManager.play_music(2, 0)
	else:
		AudioManager.play_music(1, 0)
	$Background2.visible = PlayerData.corruption > bot_cutoff and PlayerData.corruption <= top_cutoff
	$Background3.visible = PlayerData.corruption > top_cutoff
	$shade.visible = PlayerData.corruption > bot_cutoff
	$shade2.visible = PlayerData.corruption > top_cutoff
	$GUI/Transition.visible = true
	$GUI/InventoryView.visible = true
	for read in $Readables.get_children():
		read.connect("read_interactable", self, "on_read_interactable")
	for inter in $Interactables.get_children():
		inter.top_check = top_cutoff
		inter.bot_check = bot_cutoff
		inter.connect("get_key", self, "_on_get_key")
		#inter.connect("get_mind_item", self, "_on_get_mind_item")
	for chars in $Characters.get_children():
		chars.top_check = top_cutoff
		chars.bot_check = bot_cutoff
		chars.connect("play_conversation", self, "on_play_conversation")
	if PlayerData.new_game:
		PlayerData.new_game = false
	elif PlayerData.mind_side:
		$PhysicalPlayer.position.x = $MindExit.position.x
	else:
		$PhysicalPlayer.position.x = $Elevator.position.x - 164
		$PhysicalPlayer/Sprite.flip_h = true

func _process(_delta: float) -> void:
	pass

func on_read_interactable(read_id) -> void:
	$GUI/Message/Text.text = data.readings[read_id]
	$GUI/Message.visible = true

func _on_get_key(key_id, effect_statement) -> void:
	if key_id > PlayerData.floors_unlocked:
		PlayerData.floors_unlocked = key_id
		yield(get_tree().create_timer(0.5), "timeout")
		$GUI/InventoryView.update_inventory_view()
		$GUI/UI.visible = true
		$GUI/UI/ItemList.visible = false
		$GUI/UI/Textbox.play_dialogue([effect_statement])

#func _on_get_mind_item(mental_item) -> void:
#	if not mental_item in PlayerData.mind_inventory:
#		PlayerData.mind_inventory.append(mental_item)
#		$GUI/InventoryView.update_inventory_view()

func on_play_conversation(converse_id):
	converse_key = converse_id
	$GUI/UI/Textbox.play_dialogue(data.conversations[converse_id])

var converse_key = -1
func _on_Textbox_text_finished() -> void:
	if converse_key in data.key_conversations:
		PlayerData.floors_unlocked = int(max(PlayerData.floors_unlocked, data.key_conversations[converse_key]))
		$GUI/InventoryView.update_inventory_view()
	converse_key = -1
