extends Control

onready var textbox = $Textbox

func _ready() -> void:
	$Next.visible = false
	textbox.ending = true
	textbox.timer.wait_time = 0.1
	if PlayerData.ending == 0:
		textbox.play_dialogue(good)
	else:
		textbox.play_dialogue(neutral)

func _on_Next_pressed() -> void:
	if get_tree().change_scene_to(PlayerData.text_scroll) != OK:
		push_error("fail to change scene")

func _on_Textbox_text_finished() -> void:
	$Next.visible = true
	$Next.grab_focus()

var good = [
"""GOOD ENDING
				  
Subject: [REDACTED] Scott
				
Status: Mission Successful. Awaiting further orders.
"""]

var neutral = [
"""NEUTRAL ENDING
				  
Subject: [REDACTED] Scott
				
Status: Missing. Presumed killed in action.
"""]
