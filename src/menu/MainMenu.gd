extends Control

func _ready() -> void:
	if OS.get_name() == "HTML5":
		$Options/quit.visible = false
	if not AudioManager.playing or AudioManager.current != 0:
		AudioManager.play_music(0, 0)
	$Options/NewGame.grab_focus()

func _on_NewGame_pressed() -> void:
	PlayerData.reset()
	if get_tree().change_scene_to(PlayerData.text_scroll) != OK:
		push_error("fail to change scene")

func _on_Quit_pressed() -> void:
	get_tree().quit()

func _on_Credits_pressed() -> void:
	$Credits.visible = true
	$Credits/Button.grab_focus()

func _on_Settings_pressed() -> void:
	$Settings.visible = true
	$Settings/Back.grab_focus()

func _on_Button_pressed() -> void:
	$Options/NewGame.grab_focus()

func _on_Back_pressed() -> void:
	$Options/NewGame.grab_focus()
