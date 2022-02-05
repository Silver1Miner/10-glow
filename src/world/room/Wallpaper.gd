extends Area2D
class_name Wallpaper

enum WALLPAPER_TYPE {SHORT, LONG}
export var wallpaper_type = WALLPAPER_TYPE.SHORT

func _ready() -> void:
	pass

func get_class() -> String:
	return "Wallpaper"

func interact() -> int:
	print("interacting with wallpaper")
	return wallpaper_type
