extends Area2D

export var id := 0
export var query: String = "Read?"
#export var readable: bool = true
#export var interactable: bool = false
signal read_interactable(id)

func get_query() -> String:
	return query

func physical_interact() -> void:
	emit_signal("read_interactable", id)

func _on_Readable_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		print("player entered")

func _on_Readable_area_exited(area: Area2D) -> void:
	if area.is_in_group("player"):
		print("player exited")
