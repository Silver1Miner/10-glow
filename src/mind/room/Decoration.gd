extends Area2D
class_name Decoration

signal decoration_updated()

export var data: Resource = preload("res://src/data/DataResource.tres")
export var decoration_id = 0
export var decoration_type = 0
export var current_decoration = 0

func get_decoration_rating() -> int:
	return data.decorations[decoration_type][current_decoration]["rating"]

func get_decoration_type() -> int:
	return decoration_type

func interact() -> int:
	return decoration_type

func change_decoration(new_decoration: int) -> void:
	current_decoration = new_decoration
	$Sprite.texture = data.decorations[decoration_type][current_decoration]["icon"]
	emit_signal("decoration_updated")
	print("decoration changed")

func serialize_state() -> Dictionary:
	return {"type": decoration_type, "current": current_decoration}

func load_serialized(new_data: Dictionary) -> void:
	decoration_type = new_data["type"]
	change_decoration(new_data["current"])
