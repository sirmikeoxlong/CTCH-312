extends Node2D

@onready var chapel_paper: cutscene_interactables = $"Chapel Paper"
@onready var painting: cutscene_interactables = $painting
@onready var lauren: CharacterBody2D = $EnvironmetalSorting/Lauren

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


func _on_chapel_paper_body_entered(body: CharacterBody2D) -> void:
	chapel_paper.entered = true


func _on_chapel_paper_pocketed() -> void:
	chapel_paper.remove_from_scene()


func _on_painting_body_entered(body: CharacterBody2D) -> void:
	painting.entered = true


func _on_painting_pocketed() -> void:
	painting.remove_from_scene()
