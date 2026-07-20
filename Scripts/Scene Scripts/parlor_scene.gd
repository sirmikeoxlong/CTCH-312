extends Node2D

@onready var ballroom_paper: cutscene_interactables = $"Ballroom Paper"
@onready var snarky_comment: RoomTrigger = $"Dialogue/snarky comment"
@onready var lauren: CharacterBody2D = $Lauren
@onready var parlor_key: cutscene_interactables = $"Parlor Key"

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

func _on_ballroom_paper_body_entered(body: CharacterBody2D) -> void:
	ballroom_paper.entered = true
	
func _on_ballroom_paper_body_exited(body: Node2D) -> void:
	ballroom_paper.entered = false
	
func _on_ballroom_paper_pocketed() -> void:
	ballroom_paper.remove_from_scene()

func _on_snarky_comment_has_yapped_about_it() -> void:
	snarky_comment.remove_from_scene()


func _on_parlor_key_body_entered(body: Node2D) -> void:
	parlor_key.entered = true


func _on_parlor_key_body_exited(body: Node2D) -> void:
	parlor_key.entered = false


func _on_parlor_key_pocketed() -> void:
	parlor_key.remove_from_scene()
