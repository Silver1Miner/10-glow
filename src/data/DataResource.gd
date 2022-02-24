extends Resource

enum TYPE {FLOOR, WALL, DESK, BED, CHAIR, NIGHTSTAND, PAINTING}

var decorations := [
	[# FLOOR
	{"id": 0, "name": "Dirty Carpet", "rating":0, "icon": preload("res://assets/mind/walls/carpet-red.png")},
	{"id": 1, "name": "Washed Carpet", "rating":15, "icon": preload("res://assets/mind/walls/carpet.png")},
	],
	[# WALL
	{"id": 0, "name": "Dirty Wall", "rating":0, "icon": preload("res://assets/mind/walls/wall-dark.png")},
	{"id": 1, "name": "Washed Wall", "rating":15, "icon": preload("res://assets/mind/walls/wall.png")},
	],
	[# DESK
	{"id": 0, "name": "Dirty Desk", "rating":0, "icon": preload("res://assets/mind/furniture/desk-red.png")},
	{"id": 1, "name": "Washed Desk", "rating":10, "icon": preload("res://assets/mind/furniture/desk.png")}
	],
	[# BED
	{"id": 0, "name": "Dirty Bed", "rating":0, "icon": preload("res://assets/mind/furniture/bed-red.png")},
	{"id": 1, "name": "Washed Bed", "rating":15, "icon": preload("res://assets/mind/furniture/bed-green.png")}
	],
	[# CHAIR
	{"id": 0, "name": "Dirty Chair", "rating":0, "icon": preload("res://assets/mind/furniture/chair-red.png")},
	{"id": 1, "name": "Washed Chair", "rating":10, "icon": preload("res://assets/mind/furniture/chair-green.png")}
	],
	[# NIGHTSTAND
	{"id": 0, "name": "Dirty Stand", "rating":0, "icon": preload("res://assets/mind/furniture/bedside-red.png")},
	{"id": 1, "name": "Washed Stand", "rating":10, "icon": preload("res://assets/mind/furniture/bedside-green.png")}
	],
	[# PAINTING
	{"id": 0, "name": "Dirty Picture", "rating":0, "icon": preload("res://assets/mind/furniture/painting-out.png")},
	{"id": 1, "name": "Clean Picture", "rating":15, "icon": preload("res://assets/mind/furniture/painting-alt.png")}
	],
	[# FRIDGE
	{"id": 0, "name": "Dirty Fridge", "rating":0, "icon": preload("res://assets/mind/furniture/fridge-red.png")},
	{"id": 1, "name": "Clean Fridge", "rating":10, "icon": preload("res://assets/mind/furniture/fridge.png")}
	],
]

var query := [
	"Change floor?", "Change wall?",
	"Change desk?", "Change bed?", "Change chair?",
	"Chainge nightstand?", "Change painting?", "Change fridge?"
]

var readings := [
#0
"WELCOME TO MIND ROOM. "\
+"You are here because you are unhappy. "\
+"Perhaps you feel stuck in life. "\
+"Perhaps you are haunted by bad memories you'd rather forget. "\
+"We are here to help."\
+"\nTo begin, walk up to the desk. "\
+"Place three drops of the MIND solution into each eye "\
+"and then look in the MIND screen. "\
+"Your MIND ROOM will appear before you. "\
+"Redocorate as you see fit!"
,
#1
"REMEMBER: Be on the look out for glow worms! "\
+"These insidious little worms try to wriggle "\
+"their way in to ruin all the fun. "\
+"But luckily for us, they all glow in "\
+"the dark."
,
#2
"The secret of MIND ROOM is no secret at all: "\
+"we only see what we want to see. "\
+"Change your MIND, change what you SEE. "\
+"The answers are all under the melting ice."
,
#3
"BEWARE THE OLD MAN. He is not of this world. "\
+"He is not your friend. "\
+"He is a deceiver from the stars above, "\
+"when the truth is in the ground below. "\
+"What looks like treasure is trash, "\
+" and what looks like trash is treasure."
,
#4
"WE WANT TO BE YOUR FRIENDS. "\
+"Who said we were your enemies? Is it that "\
+"you can only see us enemies?"\
,
#5
"Our confessions are all here. "\
+"We have NOTHING to hide."
,
#6
"Yes, MIND ROOM owns the AI Research Company "\
+"where all the employees disappeared. "\
+"What happened at the Gaslit Office was "\
+"collateral damage, a necessary sacrifice "\
+"in our mission to guard against our TRUE enemies "\
+"above us. The OLD MAN "\
+"is not your friend. He is an agent of the STARS. "\
+"The STARS are always WATCHING."
,
#7
"Yes, the Monad Project was sponsored by "\
+"MIND ROOM using funds originally intended "\
+"for other projects. "\
+"Monad was our most ambitious project "\
+"and yet our single greatest failure. "\
+"The simulated 'God' AI was very powerful "\
+"and very quickly created a 2D toroidal grid lattice universe unprompted, "\
+"but, strangely, it came to realize it was trapped "\
+"within this universe of its own creation. "\
+"It went mad and self-terminated."\
,
#8
"You can go back to the "\
+"first floor with our written confessions. "\
+"Or you can move ahead and join us."\
+"\nThe choice is yours."
,
]

var key_conversations = {
	1: 2,
	4: 5,
}

var conversations = [
	[ # 0
	"New initiate? You do have the New Initiate Yellow Key Card...",
	"But you don't seem that open minded.",
	],
	[ # 1
	"Oh, you're a serious initiate. Sorry, I was worried you might be a glow worm.",
	"Here, you'll need this card to access the second floor.",
	"(Got a Grey Key Card)",
	],
	[ # 2
	"Always happy to see a new initiate.",
	],
	[ # 3
	"...",
	],
	[ # 4
	"We know who you really are, glow worm.",
	"But the boss was adamant that you have this. He wants you to see the fifth floor.",
	"(Got a Red Key Card)",
	],
	[ # 5
	"...",
	],
]

var intro_text = [
	[
		"Subject: [REDACTED] Scott.",
		"Occupation: Field Agent."
	],[
		"PRELIMINARIES",
		"Agent Scott, we are investigating the cult MIND ROOM.",
		"This cult has been connected to several disappearances",
		"and reports of embezzlement, tax evasion, and fraud."
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
