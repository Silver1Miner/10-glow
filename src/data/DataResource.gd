extends Resource

enum TYPE {PICTURE, CHAIR}

var choice := [
	{"name": "Yes", "icon": null},
]

var elevator := [
	{"name": "Floor 1", "icon": null},
	{"name": "Floor 2", "icon": null},
	{"name": "Floor 3", "icon": null},
	{"name": "Floor 4", "icon": null},
]

var decorations := [
	[# PICTURE
	{"id": 0, "name": "wall1", "rating":10, "icon": preload("res://assets/mind/furniture/crate_02.png")},
	{"id": 1, "name": "wall2", "rating":30, "icon": preload("res://assets/mind/furniture/crate_03.png")},
	],
	[# CHAIR
	{"id": 0, "name": "chair1", "rating":0, "icon": preload("res://assets/mind/furniture/crate_02.png")},
	{"id": 1, "name": "chair2", "rating":3, "icon": preload("res://assets/mind/furniture/crate_03.png")}
	],
	[# TABLE
	{"id": 0, "name": "table1", "rating":3, "icon": preload("res://assets/mind/furniture/crate_02.png")},
	{"id": 1, "name": "table2", "rating":3, "icon": preload("res://assets/mind/furniture/crate_03.png")}
	],
]

var readings := [
"""We can change the world
""",
]

var conversations = [
	{ # 0
	"0": {"name":"red", "profile":"red",
	"text":"Hello"},
	"1": {"name":"red", "profile":"red",
	"text":"I didn't see you get on"},
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
		"'It's Glowtime!' by Vav",
	],[
		"ART",
		"Yanagi"
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
