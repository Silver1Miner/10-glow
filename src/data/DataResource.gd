extends Resource

enum TYPE {PICTURE, CHAIR}

var choice := [
	{"name": "Yes", "icon": null},
]

var decorations := [
	[# PICTURE
	{"name": "wall1", "rating":10, "icon": preload("res://assets/mind/furniture/crate_02.png")},
	{"name": "wall2", "rating":30, "icon": preload("res://assets/mind/furniture/crate_03.png")},
	],
	[# CHAIR
	{"name": "chair1", "rating":0, "icon": preload("res://assets/mind/furniture/crate_02.png")},
	{"name": "chair2", "rating":3, "icon": preload("res://assets/mind/furniture/crate_03.png")}
	],
	[# TABLE
	{"name": "chair1", "rating":3, "icon": preload("res://assets/mind/furniture/crate_02.png")},
	{"name": "chair2", "rating":3, "icon": preload("res://assets/mind/furniture/crate_03.png")}
	],
]
