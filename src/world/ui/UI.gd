extends Control

onready var item_list = $ItemList
signal item_selected(index)

func _ready() -> void:
	pass # Replace with function body.

func populate_item_list(values: Array) -> void:
	item_list.clear()
	for item in values:
		item_list.add_item(item["name"], item["icon"])
	print(values)

func _on_ItemList_item_selected(index: int) -> void:
	print(index)
	emit_signal("item_selected", index)
