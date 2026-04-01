extends Node2D

@onready var to_study: RoomTeleport = $"Doors/To Study"
@onready var to_f_2_bathroom: RoomTeleport = $"Doors/To F2 Bathroom"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	unlock_all_doors()
	MusicManager.play_music(load("res://Sounds/AMBIENCE.ogg"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func unlock_all_doors():
	if Global.lockpick_pocketed == true:
		to_study.unlocked = true
	if Global.f2_bathroom_key_pocketed == true:
		to_f_2_bathroom.unlocked = true
