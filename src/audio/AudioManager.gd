extends AudioStreamPlayer
onready var tween = $Tween
var current = 0

# MUSIC
func play_music(index: int, start:float = 0) -> void:
	current = index
	tween.interpolate_property(self, "volume_db", linear2db(PlayerData.music_db), -80, 0.8, 1, Tween.EASE_IN, 0)
	tween.start()
	yield(tween, "tween_completed")
	tween.interpolate_property(self, "volume_db", -20, linear2db(PlayerData.music_db), 1.0, 1, Tween.EASE_IN, 0)
	tween.start()
	stream = load(musics[index])
	play(start)

var musics = [
	"res://assets/audio/its-glowtime.ogg",
	"res://assets/audio/atmoseerie04.ogg",
	"res://assets/audio/atmoseerie02.ogg"
]

# SOUND
var available = []
var queue = []
func _ready() -> void:
	for i in 16:
		var p = AudioStreamPlayer.new()
		add_child(p)
		available.append(p)
		p.connect("finished", self, "_on_sound_finished", [p])
		p.bus = "Sound"

func _on_sound_finished(next_stream):
	available.append(next_stream)

func play_sound(index: int):
	queue.append(effects[index])

func _process(_delta: float) -> void:
	if not queue.empty() and not available.empty():
		available[0].stream = load(queue.pop_front())
		available[0].play()
		available.pop_front()

var effects = [
	"res://assets/sound/scaryhighpitchedghost.ogg", #0
	"res://assets/sound/button1.ogg", #1
	"res://assets/sound/button2.ogg", #2
	"res://assets/sound/creak3.ogg", #3
	"res://assets/sound/ghostbreath.ogg", #4
]
