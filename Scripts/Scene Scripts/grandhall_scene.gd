extends Node2D

@onready var d_scene_5_enter_1: RoomTrigger = $Dialogue/d_scene5enter1
@onready var library_door_puzzle: Puzzle = $"Library Door Puzzle"
@onready var key_1: cutscene_interactables = $"Key 1"
@onready var lauren: CharacterBody2D = $"Environmental Sorting/Lauren"

# Door Paths
@onready var bootroom: RoomTeleport = $Doors/Bootroom
@onready var to_library: RoomTeleport = $"Doors/To Library"

@onready var doors: Node2D = $Doors

var last_door = Global.last_door_accessed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.lauren_movement_allowed = true
	to_library.set_process(false)
	lauren.global_position = doors.get_node(last_door).position
	MusicManager.play_music(load("res://Sounds/AMBIENCE.ogg"))
	
func unloack_all_doors():
	if Global.boot_key_collect == true:
		bootroom.unlocked = true
	if Global.lib_key1_collect == true & Global.lib_key2_collect == true & Global.lib_key3_collect == true:
		to_library.unlocked == true

func screen_shake_animation():
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# hide Carmilla until Storage Room key has been found
	# Once found, this instance of Carmilla can be unhidden and loaded up
	pass

func _on_class_room_trigger_has_yapped_about_it() -> void:
	d_scene_5_enter_1.remove_from_scene()
	print("_on_class_room_trigger_has_yapped_about_it function working")

func _on_class_puzzle_body_entered(body: CharacterBody2D) -> void:
	print("_on_class_puzzle_body_entered function entered")
	#if character has entered here and they have met the criteria, 
	# the event will trigger
	if library_door_puzzle.missing_piece() == true:
		print("detected a missing piece. Look around some more.")
	else:
		if Input.is_action_just_pressed("ui_accept"):
			library_door_puzzle.perform_event()
			to_library.set_process(true)
			print("Puzzle solved successfully")

func _on_pickup_body_entered(body: Node2D) -> void:
	key_1.entered = true

func _on_pickup_pocketed() -> void:
	key_1.remove_from_scene()

func _on_to_library_body_entered(body: CharacterBody2D) -> void:
	pass
