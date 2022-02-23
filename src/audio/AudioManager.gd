extends AudioStreamPlayer

# MUSIC
func play_music(music_path: String, start:float = 0) -> void:
	stream = load(music_path)
	play(start)

func play_layer(on: bool) -> void:
	if on:
		$Layer1.play()
	else:
		$Layer1.playing = on

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
