extends Node2D

@onready var study: RoomTeleport = $Doors/Study
@onready var f_2_bathroom: RoomTeleport = $"Doors/F2 Bathroom"
@onready var lauren: CharacterBody2D = $Lauren
@onready var doors: Node2D = $Doors
@onready var lockpick: cutscene_interactables = $Lockpick
@onready var b_2_key: cutscene_interactables = $"B2 Key"

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
		study.unlocked = true
	if Global.f2_bathroom_key_pocketed == true:
		f_2_bathroom.unlocked = true


func _on_lockpick_body_entered(body: CharacterBody2D) -> void:
	lockpick.entered = true


func _on_lockpick_body_exited(body: CharacterBody2D) -> void:
	lockpick.entered = false


func _on_lockpick_pocketed() -> void:
	lockpick.remove_from_scene()


func _on_b_2_key_body_entered(body: Node2D) -> void:
	b_2_key.entered = true


func _on_b_2_key_body_exited(body: Node2D) -> void:
	b_2_key.entered = false


func _on_b_2_key_pocketed() -> void:
	b_2_key.remove_from_scene()
