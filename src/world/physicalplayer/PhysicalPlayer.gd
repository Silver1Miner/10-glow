extends Node2D

export var data: Resource = preload("res://src/data/DataResource.tres")
var speed = 200
var direction = Vector2.ZERO
var current_target = null
onready var interface = $"../GUI/UI"
onready var itemlist = $"../GUI/UI/ItemList"
onready var textbox = $"../GUI/UI/Textbox"

func _ready() -> void:
	if interface.connect("item_activated", self, "_on_item_activated") != OK:
		push_error("UI selection connect fail")

func get_input() -> void:
	direction = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	elif Input.is_action_pressed("ui_left"):
		direction.x -= 1

func _process(delta: float) -> void:
	get_input()
	position += direction * speed * delta
	if position.x < 32:
		position.x = 32
	elif position.x > 640 - 32:
		position.x = 640 - 32

func _unhandled_input(event) -> void:
	if event.is_action_pressed("ui_up") or event.is_action_pressed("ui_down") or event.is_action_pressed("ui_select"):
		physical_interact()

func physical_interact() -> void:
	if current_target and current_target.has_method("get_query"):
		var query = current_target.get_query()
		interface.populate_item_list(data.choice)
		itemlist.visible = true
		interface.visible = true
		itemlist.select(0)
		itemlist.grab_focus()
		textbox.play_dialogue({"0": {"name":"", "profile":"",
		"text":query}})

func _on_Hitbox_area_entered(area: Area2D) -> void:
	current_target = area

func _on_Hitbox_area_exited(_area: Area2D) -> void:
	current_target = null

func _on_item_activated(index) -> void:
	if index == 1 and current_target and current_target.has_method("physical_exit"):
		current_target.physical_exit()
		interface.visible = false
