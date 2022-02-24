extends Area2D

export var id := 0
export var key_id := 0
export var corruption_cutoff = 30
export var query: String = "Check water cooler?"
export var effect_statement: String = "Got a Green Key Card"
#export var mental_item: String = ""
export var deactivated: bool = false
export var inverted_corruption_check: bool = false
#export var interactable: bool = true
#export var readable: bool = false
#signal read_interactable(id)
signal get_key(key_id, effect_statement)
#signal get_mind_item(mental_item)

func _ready() -> void:
	if inverted_corruption_check:
		visible = PlayerData.corruption < corruption_cutoff
	else:
		visible = PlayerData.corruption >= corruption_cutoff
	deactivated = key_id <= PlayerData.floors_unlocked

func get_query() -> String:
	return query

func physical_interact() -> void:
	#if readable:
	#	emit_signal("read_interactable", id)
	if key_id > PlayerData.floors_unlocked:
		emit_signal("get_key", key_id, effect_statement)
		deactivated = true
	#elif len(mental_item) > 0 and not mental_item in PlayerData.mind_inventory:
	#	emit_signal("get_mind_item", mental_item)

func get_effect_statement() -> String:
	return effect_statement

func _on_Interactable_area_entered(area: Area2D) -> void:
	if area.is_in_group("player") and not deactivated:
		$Sprite.self_modulate = Color(1.2,1.2,1.2)

func _on_Interactable_area_exited(area: Area2D) -> void:
	if area.is_in_group("player"):
		$Sprite.self_modulate = Color(1,1,1,1)
