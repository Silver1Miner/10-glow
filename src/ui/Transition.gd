extends ColorRect

onready var _animation = $AnimationPlayer

func _ready() -> void:
	_animation.play_backwards("Fade")

func transition_to(_next_scene) -> void:
	_animation.play("Fade")
	yield(_animation, "animation_finished")
	if get_tree().change_scene_to(_next_scene) != OK:
		push_error("fail to change scene")
