extends Control

onready var item_list = $ItemList
signal item_activated(index)

func _ready() -> void:
	pass

func populate_item_list(values: Array) -> void:
	item_list.clear()
	item_list.add_item("Cancel")
	for item in values:
		item_list.add_item(item["name"], item["icon"])
	print(values)

func _on_ItemList_item_activated(index: int) -> void:
	if index == 0:
		visible = false
	else:
		emit_signal("item_activated", index)
	get_tree().set_input_as_handled()
