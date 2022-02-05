extends StaticBody2D

func _ready() -> void:
	pass # Replace with function body.

func get_class() -> String:
	return "Exit"

func interact() -> int:
	print("interacting with exit")
	return 0
