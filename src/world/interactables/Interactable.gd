extends Area2D

export var query: String = "Flip switch?"

func get_query() -> String:
	return query

func physical_interact() -> void:
	print("interacted")
