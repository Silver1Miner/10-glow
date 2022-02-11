extends Node

var new_game = true

var corruption := 0
var level := 0

var decorations := {}
var inventory := ["wall2"]

var main_menu = preload("res://src/menu/MainMenu.tscn")
var test_world = preload("res://src/world/World.tscn")
var mind_room = preload("res://src/mind/room/Room.tscn")
var text_scroll = preload("res://src/UI/TextScroll.tscn")
