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
+"\nYOU are here because you are unhappy, "\
+"and WE are here to help."\
+"\nTo begin, walk up to the desk. "\
+"Drink a sip of the green fluid and then "\
+"insert the catheter into either eye. "\
+"Look in the MIND screen with the "\
+"other eye. Your MIND ROOM will appear before you. "\
+"\nWARNING: It is NOT recommended to "\
+"introduce too many changes to your MIND ROOM "\
+"in a single session."
,
#1
"REMEMBER: Be on the look out for glow worms! "\
+"These insidious little worms try to wriggle "\
+"their way in to ruin all the fun. "\
+"But luckily for us, they all GLOW in "\
+"the DARK."
,
#2
"The secret of MIND ROOM is no secret at all: "\
+"we only see what we want to see. "\
+"Change your MIND, change what you SEE. "\
+"\nThe answers lie ABOVE the three zero."
,
#3
"BEWARE THE OLD MAN. He is not of this world. "\
+"He is not your friend. "\
+"He claims he wishes to help you up, "\
+"when you need to be going DOWN. "\
+"Down below the fifth hexagon."\
+"\nThen you will see, that "\
+"what looks like treasure is trash, "\
+" and what looks like trash is treasure."
,
#4
"WE WANT TO BE YOUR FRIENDS. "\
+"Who said we were your enemies? Is it that "\
+"you can only see us enemies? "\
+"\nYou need only reach ABOVE the 23rd Prime."\
,
#5
"You have completed your mission. "\
+"You have confirmed the "\
+"presence of the incriminating evidence "\
+"on the fifth floor. Return to the first "\
+"floor and leave the building to "\
+"report your findings."
,
#6
"Project Report: Gaslit Office. "\
+"\nGoal: Increase available electricty "\
+"to research computers by replacing all "\
+"electric lights with gas lighting. "\
+"\nExperiment: Gas lighting was installed "\
+"at satellite office Number Six."\
+"\nResult: All employees at the office "\
+"are now missing."\
+"\nProposed Next Steps: "\
+"The STARS are always WATCHING."
,
#7
"Project Report: Monad "\
+"\nExperiment: Construct an AI to simulate a "\
+"God and observe its behavior in constructing "\
+"a universe."\
+"\nResult: AI began construction of a "\
+"universe immediately upon activation, "\
+"featuring 2 spatial and "\
+"1 time dimension in a toroid. "\
+"However, "\
+"the AI came to realize it was trapped "\
+"within this universe of its own creation. "\
+"It went mad and self-terminated."
,
#8
"Project Report: Mind Worm "\
+"\nGoal: Develop a method to completely "\
+"remodel a person's mind."\
+"\nExperiment: Convince the test subject "\
+"that they are [REDACTED]. Observe their "\
+"resulting behavior."\
+"\nResult: Pending. Experiment is still "\
+"in progress."
,
]

var key_conversations = {
	1: 2,
	4: 5,
}

var conversations = [
	[ # 0
	"New initiate? You do have the New Initiate Yellow Key Card...",
	"But you don't seem that open minded to change.",
	],
	[ # 1
	"Oh, you're a serious initiate. Sorry, I was worried you might be a glow worm.",
	"Here, you'll need this card to access the second floor.",
	"(Got a Grey Key Card)",
	],
	[ # 2
	"Always happy to see a new initiate. Just remember not to change too much all at once.",
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
		"Gain access to the Fifth Floor containing the evidence.",
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
