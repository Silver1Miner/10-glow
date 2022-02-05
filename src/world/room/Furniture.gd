extends StaticBody2D
class_name Furniture

enum FURNITURE_TYPE {CHAIR, TABLE}
export var furniture_type = FURNITURE_TYPE.CHAIR

func _ready() -> void:
	pass

func get_class() -> String:
	return "Furniture"

func interact() -> int:
	print("interacting with furniture")
	return furniture_type
