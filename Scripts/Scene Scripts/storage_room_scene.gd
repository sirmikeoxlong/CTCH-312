extends Node2D

@onready var staffroom_key: cutscene_interactables = $"Staffroom Key"
@onready var lauren: CharacterBody2D = $Lauren

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
			
	MusicManager.play_music(load("res://Sounds/AMBIENCE.ogg"))
	Global.lauren_movement_allowed = true
	
	if !(last_door == ""):
		lauren.global_position = get_node(Global.last_door_accessed).position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_staffroom_key_body_entered(body: CharacterBody2D) -> void:
	staffroom_key.entered = true


func _on_staffroom_key_pocketed() -> void:
	staffroom_key.remove_from_scene()
	Global.staff_room_key_collect = true
