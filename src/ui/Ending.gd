extends Control

onready var textbox = $Textbox

func _ready() -> void:
	$Next.visible = false
	textbox.ending = true
	textbox.timer.wait_time = 0.1
	textbox.play_dialogue(good)

func _on_Next_pressed() -> void:
	if get_tree().change_scene_to(PlayerData.main_menu) != OK:
		push_error("fail to change scene")

func _on_Textbox_text_finished() -> void:
	$Next.visible = true
	$Next.grab_focus()

var good = [
"""GOOD ENDING
				  
Subject: [REDACTED] Scott
				
Status: Missing
"""]

var neutral = [
"""NEUTRAL ENDING
				  
Subject: [REDACTED] Scott
				
Status: Missing
"""]
