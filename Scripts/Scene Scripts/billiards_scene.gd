extends Node2D

@onready var billiards_paper: cutscene_interactables = $"Billiards Paper"
@onready var lauren: CharacterBody2D = $Lauren
var last_door = Global.last_door_accessed



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.exposition_complete = true
	randomize()
	var my_random_number = randi_range(0, 5)
	
	MusicManager.play_music(load("res://Sounds/AMBIENCE.ogg"))
	Global.lauren_movement_allowed = true
	
	if !(last_door == ""):
		lauren.global_position = get_node(Global.last_door_accessed).position
		
	if Global.exposition_complete:
		print(my_random_number)
		if (my_random_number % 2 == 0):
			StateCarmilla.call_for_spawn = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_billiards_paper_body_entered(body: CharacterBody2D) -> void:
	billiards_paper.entered = true


func _on_billiards_paper_pocketed() -> void:
	billiards_paper.remove_from_scene()
