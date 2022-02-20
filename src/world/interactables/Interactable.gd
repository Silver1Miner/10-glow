extends Area2D

export var id := 0
export var key_id := 0
export var corruption_cutoff = 30
export var query: String = "Flip switch?"
export var effect_statement: String = "Got a Key"
export var mental_item: String = "Red Eye"
#export var interactable: bool = true
#export var readable: bool = false
#signal read_interactable(id)
signal get_key(key_id)
signal get_mind_item(mental_item)

func _ready() -> void:
	visible = PlayerData.corruption < corruption_cutoff

func get_query() -> String:
	return query

func physical_interact() -> void:
	#if readable:
	#	emit_signal("read_interactable", id)
	if key_id > PlayerData.floors_unlocked:
		emit_signal("get_key", key_id)
	elif len(mental_item) > 0 and not mental_item in PlayerData.mind_inventory:
		emit_signal("get_mind_item", mental_item)

func get_effect_statement() -> String:
	return effect_statement
