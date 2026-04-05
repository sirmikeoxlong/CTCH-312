extends Node2D

@onready var to_study: RoomTeleport = $"Doors/To Study"
@onready var f_2_bathroom: RoomTeleport = $"Doors/F2 Bathroom"
@onready var lauren: CharacterBody2D = $Lauren
@onready var doors: Node2D = $Doors

var last_door = Global.last_door_accessed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	unlock_all_doors()
	MusicManager.play_music(load("res://Sounds/AMBIENCE.ogg"))
	Global.lauren_movement_allowed = true
	
	if !(last_door == ""):
		lauren.global_position = doors.get_node(Global.last_door_accessed).position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func unlock_all_doors():
	if Global.lockpick_pocketed == true:
		to_study.unlocked = true
	if Global.f2_bathroom_key_pocketed == true:
		f_2_bathroom.unlocked = true
