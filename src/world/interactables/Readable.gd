extends Area2D

export var id := 0
export var query: String = "Read?"
#export var readable: bool = true
#export var interactable: bool = false
signal read_interactable(id)

func get_query() -> String:
	return query

func physical_interact() -> void:
	emit_signal("read_interactable", id)
