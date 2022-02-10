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
