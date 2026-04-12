extends Node2D

@onready var d_scene_5_enter_1: RoomTrigger = $Dialogue/d_scene5enter1
@onready var library_door_puzzle: Puzzle = $"Library Door Puzzle"
@onready var key_1: cutscene_interactables = $"Key 1"
@onready var lauren: CharacterBody2D = $"Environmental Sorting/Lauren"

# Door Paths
@onready var bootroom: RoomTeleport = $Doors/Bootroom
@onready var doors: Node2D = $Doors

var last_door = Global.last_door_accessed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.player_curr_pos = lauren.position
	randomize()
	var my_random_number = randi_range(0, 5)
	
	if Global.exposition_complete:
		print(my_random_number)
		if (my_random_number % 2 == 0):
			StateCarmilla.call_for_spawn = true	
			
	Global.lauren_movement_allowed = true
	if !(last_door == ""):
		lauren.global_position = doors.get_node(last_door).position
	MusicManager.play_music(load("res://Sounds/AMBIENCE.ogg"))
	
func unloack_all_doors():
	if Global.boot_key_collect == true:
		bootroom.unlocked = true
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# hide Carmilla until Storage Room key has been found
	# Once found, this instance of Carmilla can be unhidden and loaded up
	pass

func _on_class_room_trigger_has_yapped_about_it() -> void:
	d_scene_5_enter_1.remove_from_scene()
	print("_on_class_room_trigger_has_yapped_about_it function working")

func _on_pickup_body_entered(body: Node2D) -> void:
	key_1.entered = true

func _on_pickup_pocketed() -> void:
	key_1.remove_from_scene()
