extends Control

var page := 0
var text_playing = true
var ending = false
var dialogue = {}
onready var timer := $Timer
onready var text := $Sections/TextBox/Text
onready var next_button := $Sections/ButtonBox/Next
onready var skip_button := $Sections/ButtonBox/Skip

signal text_finished()
var test_dialogue = [
	"0123456789!",
	"the quick brown fox jumps over the lazy dog",
]

func _ready() -> void:
	timer.wait_time = 0.05
	timer.autostart = true
	#play_dialogue(test_dialogue)

func play_dialogue(scene) -> void:
	visible = true
	timer.start()
	dialogue = scene.duplicate(true)
	text_playing = true
	page = 0
	if page > len(dialogue):
		end_text()
	text.set_text(dialogue[page])
	text.set_visible_characters(0)
	set_process_input(true)

var possible_progress = ["ui_left", "ui_right", "ui_up", "ui_down", "ui_select"]
func _unhandled_input(event: InputEvent) -> void:
	for p in possible_progress:
		if event.is_action_pressed(p):
			_on_Next_pressed()

func end_text() -> void:
	emit_signal("text_finished")
	if ending:
		return
	visible = false

func _on_Next_pressed() -> void:
	if text_playing:
		if text.get_visible_characters() > text.get_total_character_count():
			if int(page) < dialogue.size() - 1:
				page += 1
				text.set_text(dialogue[page])
				text.set_visible_characters(0)
			elif int(page) >= dialogue.size() - 1:
				end_text()
		else:
			text.set_visible_characters(text.get_total_character_count())

func _on_Skip_pressed() -> void:
	if text_playing:
		end_text()

func _on_Timer_timeout() -> void:
	text.set_visible_characters(text.get_visible_characters()+1)
