extends Node

@onready var player: AudioStreamPlayer = AudioStreamPlayer.new()

var current_track: AudioStream = null
@export var default_volume: float = -10.0

func _ready():
	add_child(player)
	player.volume_db = default_volume

func play_music(stream: AudioStream, volume := default_volume):
	if stream == null:
		return
	
	if current_track == stream and player.playing:
		return
	
	current_track = stream
	player.stream = stream
	player.volume_db = -23
	player.play()

func stop_music():
	player.stop()
	current_track = null
