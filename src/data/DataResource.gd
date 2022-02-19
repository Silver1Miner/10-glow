extends Resource

enum TYPE {FLOOR, WALL, DESK, BED, CHAIR, NIGHTSTAND, PAINTING}

var decorations := [
	[# FLOOR
	{"id": 0, "name": "floor1", "rating":0, "icon": preload("res://assets/mind/walls/carpet.png")},
	{"id": 1, "name": "floor2", "rating":10, "icon": preload("res://assets/mind/walls/carpet.png")},
	],
	[# WALL
	{"id": 0, "name": "wall1", "rating":0, "icon": preload("res://assets/mind/walls/wall.png")},
	{"id": 1, "name": "wall2", "rating":20, "icon": preload("res://assets/mind/walls/wall.png")},
	],
	[# DESK
	{"id": 0, "name": "desk1", "rating":0, "icon": preload("res://assets/mind/furniture/desk.png")},
	{"id": 1, "name": "desk2", "rating":30, "icon": preload("res://assets/mind/furniture/desk.png")}
	],
	[# BED
	{"id": 0, "name": "bed1", "rating":0, "icon": preload("res://assets/mind/furniture/bed-green.png")},
	{"id": 1, "name": "bed2", "rating":40, "icon": preload("res://assets/mind/furniture/bed-green.png")}
	],
	[# CHAIR
	{"id": 0, "name": "chair1", "rating":0, "icon": preload("res://assets/mind/furniture/chair-green.png")},
	{"id": 1, "name": "chair2", "rating":3, "icon": preload("res://assets/mind/furniture/chair-green.png")}
	],
	[# NIGHTSTAND
	{"id": 0, "name": "nightstand1", "rating":0, "icon": preload("res://assets/mind/furniture/bedside-green.png")},
	{"id": 1, "name": "nightstand2", "rating":4, "icon": preload("res://assets/mind/furniture/bedside-green.png")}
	],
	[# PAINTING
	{"id": 0, "name": "painting1", "rating":0, "icon": preload("res://assets/mind/furniture/painting.png")},
	{"id": 1, "name": "painting2", "rating":2, "icon": preload("res://assets/mind/furniture/painting.png")}
	],
	[# FRIDGE
	{"id": 0, "name": "fridge1", "rating":0, "icon": preload("res://assets/mind/furniture/fridge.png")},
	{"id": 1, "name": "fridge2", "rating":2, "icon": preload("res://assets/mind/furniture/fridge.png")}
	],
]

var query := [
	"Change floor?", "Change wall?",
	"Change desk?", "Change bed?", "Change chair?",
	"Chainge nightstand?", "Change painting?", "Change fridge?"
]

var readings := [
#0
"""We can change the world
""",
#1
"""REMEMBER: Be on the look out for glow worms!
Infiltrators are always obvious if you look closely enough. They don't fit in.
They're as obvious as if they were glowing in the dark.
""",
#2
"""""",
#3
"""""",
#4
"""""",
]

var key_conversations = {
	1: 1,
	2: 2,
	3: 3,
	4: 4,
	5: 5
}

var conversations = [
	{ # 0
	"0": {"name":"red", "profile":"red",
	"text":"Hello"},
	"1": {"name":"red", "profile":"red",
	"text":"I didn't see you get on"},
	},
	{ # 1
	"0": {"name":"red", "profile":"red",
	"text":"Oh, you're a serious initiate."},
	"1": {"name":"red", "profile":"red",
	"text":"Here, you'll need this card to access the second floor."},
	},
]

var intro_text = [
	[
		"Subject: [REDACTED].",
		"Occupation: Field Agent."
	],[
		".",
		".",
	],[
		".",
		".",
		".",
	],[
		"CURRENT MISSION OBJECTIVES",
		"Infiltrate Cult.",
		"Collect 10 Pieces of Evidence.",
	],[
		"Escape Alive.",
	]
]

var credits = [
	[
		"Glow Worm",
		"by Jack Anderson"
	],[
		"SOUNDTRACK",
		"\"It's Glowtime!\" by Vav",
	],[
		"Additional CC0 Assets from",
		"opengameart.org",
		"freesound.org",
		"kenney.nl",
		"unsplash.com",
		"fonts.google.com"
	],[
		"TOOLS",
		"Godot",
		"Krita",
	],[
		"This is a work of fiction.",
		"Any resemblance to actual events or persons,",
		"living or dead, is entirely coincidental."
	],
]
