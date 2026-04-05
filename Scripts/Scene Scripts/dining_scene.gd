extends Node2D

@onready var dining_paper: cutscene_interactables = $"Dining Paper"
@onready var lauren: CharacterBody2D = $Lauren

var last_door = Global.last_door_accessed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
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
