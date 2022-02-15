extends VBoxContainer

func _ready() -> void:
	update_inventory_view()

func update_inventory_view() -> void:
	$Items/Key1.visible = PlayerData.floors_unlocked > 0
	$Items/Key2.visible = PlayerData.floors_unlocked > 1
	$Items/Key3.visible = PlayerData.floors_unlocked > 2
	$Items/Key4.visible = PlayerData.floors_unlocked > 3
	$Items/Key5.visible = PlayerData.floors_unlocked > 4
