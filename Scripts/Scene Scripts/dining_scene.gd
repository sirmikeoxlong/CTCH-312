extends Node2D

@onready var dining_paper: cutscene_interactables = $"Dining Paper"
@onready var lauren: CharacterBody2D = $"Environmental Sorting/Lauren"

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

func _on_dining_paper_body_entered(body: Node2D) -> void:
	dining_paper.entered = true
	

func _on_dining_paper_pocketed() -> void:
	dining_paper.remove_from_scene()
