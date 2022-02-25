extends ColorRect

func _on_Button_pressed() -> void:
	visible = false

func _on_ToEndCredits_pressed() -> void:
	PlayerData.new_game = false
	if get_tree().change_scene_to(PlayerData.text_scroll) != OK:
		push_error("change scene error")
