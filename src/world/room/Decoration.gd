extends Area2D
class_name Decoration

export var data: Resource = preload("res://src/data/DataResource.tres")
export var decoration_type = 0

func _ready() -> void:
	pass

func get_decoration_type() -> int:
	return decoration_type

func interact() -> int:
	print("interacting with decoration")
	return decoration_type

func change_decoration(new_decoration: int) -> void:
	$Sprite.texture = data.decorations[decoration_type][new_decoration]["icon"]
