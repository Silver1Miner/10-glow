extends Control

func _ready() -> void:
	pass # Replace with function body.

func _on_NewGame_pressed() -> void:
	if get_tree().change_scene("res://src/world/World.tscn") != OK:
		push_error("fail to change scene")


func _on_Quit_pressed() -> void:
	get_tree().quit()
