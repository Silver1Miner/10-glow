extends Node

var new_game = true
var current_floor := 1
var corruption := 0
var floors_unlocked := 1
var mind_side = true

var decorations := {}
#var mind_inventory := [
#	"wall1", "wall2","floor1","floor2","desk1","bed1",
#	"bed2","chair1","chair2","nightstand1","painting1","fridge1"
#]

var main_menu = preload("res://src/menu/MainMenu.tscn")
var test_world = preload("res://src/world/World.tscn")
var mind_room = preload("res://src/mind/room/Room.tscn")
var text_scroll = preload("res://src/UI/TextScroll.tscn")
var ending = preload("res://src/ui/Ending.tscn")

var floors_choice := [
	{"name": "Floor 1", "icon": null},
	{"name": "Floor 2", "icon": null},
	{"name": "Floor 3", "icon": null},
	{"name": "Floor 4", "icon": null},
	{"name": "Floor 5", "icon": null},
]

var choice := [
	{"name": "Yes", "icon": null},
]

var floors := {
	1: preload("res://src/world/levels/Floor1.tscn"),
	2: preload("res://src/world/levels/Floor2.tscn"),
	3: preload("res://src/world/levels/Floor3.tscn"),
	4: preload("res://src/world/levels/Floor4.tscn"),
	5: preload("res://src/world/levels/Floor5.tscn"),
}
