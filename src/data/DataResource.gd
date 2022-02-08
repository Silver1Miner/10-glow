extends Resource

enum TYPE {PICTURE, CHAIR}

var choice := [
	{"name": "Yes", "icon": null},
]

var decorations := [
	[# PICTURE
	{"name": "wall1", "icon": preload("res://assets/mind/furniture/crate_02.png")},
	{"name": "wall2", "icon": preload("res://assets/mind/furniture/crate_03.png")},
	],
	[# CHAIR
	{"name": "chair1", "icon": preload("res://assets/mind/furniture/crate_02.png")},
	{"name": "chair2", "icon": preload("res://assets/mind/furniture/crate_03.png")}
	],
	[# TABLE
	{"name": "chair1", "icon": preload("res://assets/mind/furniture/crate_02.png")},
	{"name": "chair2", "icon": preload("res://assets/mind/furniture/crate_03.png")}
	],

]

var wallpapers := [
	{"name": "wall1", "icon": preload("res://assets/mind/furniture/crate_02.png")},
	{"name": "wall2", "icon": preload("res://assets/mind/furniture/crate_03.png")},
]
var chairs := [
	{"name": "chair1", "icon": preload("res://assets/mind/furniture/crate_02.png")},
	{"name": "chair2", "icon": preload("res://assets/mind/furniture/crate_02.png")}
]
