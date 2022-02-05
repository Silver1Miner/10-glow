extends Node

func _ready() -> void:
	if $GUI/UI.connect("item_selected", self, "_on_item_selected") != OK:
		push_error("UI selection connect fail")

func _on_item_selected(index) -> void:
	print(index)
