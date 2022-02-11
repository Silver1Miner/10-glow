extends Area2D

export var text_id = 0
signal play_conversation(text_id)

func converse() -> void:
	print("converse")
	emit_signal("play_conversation", text_id)
