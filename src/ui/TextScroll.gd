extends Control

var data: Resource = preload("res://src/data/DataResource.tres")
var next_level = null
const section_time := 2.0
const line_time := 0.8
const speed_up_multiplier := 10.0

var base_speed := 20
var speed_up := false

onready var skip_button := $Skip
onready var line := $Container/Label
onready var text_container := $Container
var started := false
var finished := false

var section
var section_next := true
var section_timer := 0.0
var line_timer := 0.0
var curr_line := 0
var lines := []
var text := []

func _ready() -> void:
	if PlayerData.new_game:
		$image.texture = null
		base_speed = 30
		text = data.intro_text.duplicate(true)
		#PlayerData.next_scene = 30
		next_level = PlayerData.floors[1]
		#PlayerData.new_game = false
	else:
		base_speed = 30
		text = data.credits.duplicate(true)
		#$image.texture = PlayerData.ending_background
		next_level = PlayerData.main_menu

func _process(delta: float) -> void:
	var scrolling_speed = base_speed * delta
	if section_next:
		section_timer += delta * speed_up_multiplier if speed_up else delta
		if section_timer >= section_time:
			section_timer -= section_time
			if text.size() > 0:
				started = true
				section = text.pop_front()
				curr_line = 0
				add_line()
	else:
		line_timer += delta * speed_up_multiplier if speed_up else delta
		if line_timer >= line_time:
			line_timer -= line_time
			add_line()
	if speed_up:
		scrolling_speed *= speed_up_multiplier
	if lines.size() > 0:
		for l in lines:
			l.rect_position.y -= scrolling_speed
			if l.rect_position.y < -l.get_line_height():
				lines.erase(l)
				l.queue_free()
	elif started:
		finish()

func finish():
	if not finished:
		finished = true
		if get_tree().change_scene_to(next_level) != OK:
			push_error("fail to change scene")

func add_line():
	var new_line = line.duplicate(true)
	new_line.text = section.pop_front()
	lines.append(new_line)
	text_container.add_child(new_line)
	if section.size() > 0:
		curr_line += 1
		section_next = false
	else:
		section_next = true

func _unhandled_input(event) -> void:
	if event.is_action_pressed("ui_cancel"):
		finish()
	if event.is_action_pressed("ui_down") and !event.is_echo():
		speed_up = true
	if event.is_action_released("ui_down") and !event.is_echo():
		speed_up = false

func _on_Skip_pressed() -> void:
	finish()
