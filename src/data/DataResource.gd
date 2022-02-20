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
"""WELCOME TO MIND ROOM.
You are here because you are unhappy
""",
#1
"""REMEMBER: Be on the look out for glow worms!
This insidious little worms try to wiggle their way in to ruin all the fun. But luckily for us, they all glow in the dark.
""",
#2
"""Remember the Parable of the Monad Project:
Once upon a time, a rich and powerful Artificial Intelligence (AI) company attempted to create a simulation of God. The simulated 'God' AI was very powerful and created a 2D toroidal grid lattice universe, but upon realizing it was trapped within this universe, it went mad and self-terminated.
""",
#3
"""BEWARE THE OLD MAN. He is not of this world. He is not your friend.
He is a deceiver from the stars above, when the truth is in the ground below.""",
#4
"""What happened in the Gaslit Office was unfortunate, but necessary. Some minds simply cannot accept our teachings. It is better to catch those earlier than later.""",
#5
"""The evidence is all here.""",
#6
"""""",
#7
"""""",
#8
"""The choice is yours. You can go back to the first floor with your evidence. Or you can move ahead and join us.""",
]

var key_conversations = {
	1: 2,
	4: 5,
}

var conversations = [
	{ # 0
	"0": {"name":"red", "profile":"red",
	"text":"New initiate? You do have the New Initiate Yellow Key Card..."},
	"1": {"name":"red", "profile":"red",
	"text":"But you don't seem that open minded."},
	},
	{ # 1
	"0": {"name":"red", "profile":"red",
	"text":"Oh, you're a serious initiate."},
	"1": {"name":"red", "profile":"red",
	"text":"Sorry, I was worried you might be a glow worm."},
	"2": {"name":"red", "profile":"red",
	"text":"Here, you'll need this card to access the second floor."},
	},
	{ # 2
	"0": {"name":"red", "profile":"red",
	"text":"Always happy to see a new initiate."},
	},
	{ # 3
	"0": {"name":"red", "profile":"red",
	"text":"..."},
	},
	{ # 4
	"0": {"name":"red", "profile":"red",
	"text":"We know who you really are."},
	"1": {"name":"red", "profile":"red",
	"text":"You will need this to complete your mission."},
	},
	{ # 5
	"0": {"name":"red", "profile":"red",
	"text":"..."},
	},
]

var intro_text = [
	[
		"Subject: [REDACTED] Scott.",
		"Occupation: Field Agent."
	],[
		"PRELIMINARIES",
		"Agent Scott, we are investigating the cult MIND ROOM.",
		"This cult has been connected to several disappearances.",
	],[
		"WARNINGS",
		"We believe MIND ROOM conducts very advanced brainwashing.",
		"You may need to subjected to this during infiltration.",
		"Be on guard that they do not corrupt your mind.",
	],[
		"MISSION OBJECTIVES",
		"Infiltrate Cult.",
		"Collect the Evidence on the Fifth Floor.",
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
