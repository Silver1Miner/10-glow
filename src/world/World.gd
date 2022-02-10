extends Node2D

export var data: Resource = preload("res://src/data/DataResource.tres")

func _ready() -> void:
	for inter in $Interactables.get_children():
		if inter.readable:
			inter.connect("read_interactable", self, "on_read_interactable")

func on_read_interactable(read_id):
	$GUI/Message/Text.text = data.readings[read_id]
	$GUI/Message.visible = true
