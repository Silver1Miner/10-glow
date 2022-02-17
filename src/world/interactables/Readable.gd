extends Area2D

export var id := 0
export var query: String = "Read?"
export var readable: bool = true
signal read_interactable(id)

func get_query() -> String:
	return query

func physical_interact() -> void:
	print("interacted")
	if readable:
		emit_signal("read_interactable", id)
