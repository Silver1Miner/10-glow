extends Area2D

export var id := 0
export var query: String = "Flip switch?"
export var readable: bool = false
signal read_interactable(id)

func get_query() -> String:
	return query

func physical_interact() -> void:
	print("interacted")
	if readable:
		emit_signal("read_interactable", id)
