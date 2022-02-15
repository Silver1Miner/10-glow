extends Area2D

export var id := 0
export var query: String = "Flip switch?"
export var effect_statement: String = "Got a Key"
export var physical_item: String = "Key 1"
export var mental_item: String = "Red Eye"
export var readable: bool = false
signal read_interactable(id)

func get_query() -> String:
	return query

func physical_interact() -> void:
	print("interacted")
	if readable:
		emit_signal("read_interactable", id)
	if len(physical_item) > 0:
		print(physical_item)
	if len(mental_item) > 0:
		print(mental_item)

func get_effect_statement() -> String:
	return effect_statement
