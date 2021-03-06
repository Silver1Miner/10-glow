extends Node2D

export var data: Resource = load("res://src/data/DataResource.tres")
var speed = 200
var direction = Vector2.ZERO
var current_target = null
onready var interface = $"../GUI/UI"
onready var itemlist = $"../GUI/UI/ItemList"
onready var textbox = $"../GUI/UI/Textbox"
onready var message = $"../GUI/Message"

func _ready() -> void:
	if interface and interface.connect("item_activated", self, "_on_item_activated") != OK:
		push_error("UI selection connect fail")
	$"../GUI/MindRating".text = "Corruption:" + str(PlayerData.corruption)

func get_input() -> void:
	direction = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		$Sprite.flip_h = false
		direction.x += 1
		message.visible = false
		interface.visible = false
		if not $AnimationPlayer.is_playing():
			$AnimationPlayer.play("walk")
	elif Input.is_action_pressed("ui_left"):
		$Sprite.flip_h = true
		direction.x -= 1
		message.visible = false
		interface.visible = false
		if not $AnimationPlayer.is_playing():
			$AnimationPlayer.play("walk")
	else:
		$AnimationPlayer.play("RESET")

func _process(delta: float) -> void:
	get_input()
	position += direction * speed * delta
	if position.x < 32:
		position.x = 32
	elif position.x > 1280 - 32:
		position.x = 1280 - 32

func _unhandled_input(event) -> void:
	if not interface.visible and event.is_action_pressed("ui_select") or event.is_action_pressed("ui_accept"):
		physical_interact()
		get_tree().set_input_as_handled()
		message.visible = false

func physical_interact() -> void:
	if not message.visible and current_target and current_target.visible:
		if "deactivated" in current_target and current_target.deactivated:
			return
		if current_target.has_method("get_query"):
			var query = current_target.get_query()
			if current_target.has_method("use_elevator"):
				interface.populate_item_list(PlayerData.floors_choice.slice(0, PlayerData.floors_unlocked-1))
			else:
				interface.populate_item_list(PlayerData.choice)
			itemlist.visible = true
			interface.visible = true
			itemlist.select(0)
			itemlist.grab_focus()
			textbox.play_dialogue([query])
		elif not interface.visible and current_target.has_method("converse"):
			itemlist.visible = false
			interface.visible = true
			current_target.converse()

func _on_Hitbox_area_entered(area: Area2D) -> void:
	current_target = area

func _on_Hitbox_area_exited(_area: Area2D) -> void:
	current_target = null

func _on_item_activated(index) -> void:
	if index >= 1 and current_target:
		if current_target.has_method("physical_exit"):
			current_target.physical_exit()
			interface.visible = false
		elif current_target.has_method("physical_interact"):
			current_target.physical_interact()
			interface.visible = false
		elif current_target.has_method("use_elevator"):
			current_target.use_elevator(index)
			interface.visible = false
