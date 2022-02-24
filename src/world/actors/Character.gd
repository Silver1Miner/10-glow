extends Area2D

export var corruption_check = 30
export var purity_check = 0
export var suspicious_text_id = 0
export var corrupt_text_id = 1
export var normal_text_id = 2
export var key_card = 2
export var can_disappear: bool = false
signal play_conversation(text_id)
onready var player = $"../../PhysicalPlayer"

func _ready() -> void:
	if can_disappear:
		visible = PlayerData.corruption < corruption_check
	else:
		visible = true

func converse() -> void:
	print("converse")
	if PlayerData.corruption < corruption_check:
		emit_signal("play_conversation", suspicious_text_id)
	elif PlayerData.floors_unlocked < key_card:
		emit_signal("play_conversation", corrupt_text_id)
	else:
		emit_signal("play_conversation", normal_text_id)

func _process(_delta: float) -> void:
	if PlayerData.corruption < corruption_check and player.position.x < position.x:
		$Sprite.flip_h = true
	else:
		$Sprite.flip_h = false

func _on_Character_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		$Sprite.self_modulate = Color(1.2,1.2,1.2)

func _on_Character_area_exited(area: Area2D) -> void:
	if area.is_in_group("player"):
		$Sprite.self_modulate = Color(1,1,1,1)
