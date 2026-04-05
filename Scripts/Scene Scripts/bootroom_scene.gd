extends Node2D

@onready var spare_bedroom_key: cutscene_interactables = $"Spare Bedroom Key"
@onready var cutscene_redirect_path : String = "res://Scenes/Cutscenes/cutscene_1.tscn"
@onready var normal_door_path : String = "res://Scenes/Playable Scenes/grandhall_scene.tscn"
@onready var to_great_hall: RoomTeleport = $"To Great Hall"
@onready var to_cutscene_1: RoomTeleport = $"To cutscene 1"
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
	#cutscene_redirect()
	cutscene_redirect()


func _on_spare_bedroom_key_body_entered(body: CharacterBody2D) -> void:
	spare_bedroom_key.entered = true


func _on_spare_bedroom_key_pocketed() -> void:
	spare_bedroom_key.remove_from_scene()
	Global.spare_bed_key = true
	
func cutscene_redirect():
	#if Global.cutscene_1_completed == false:
		##Change the door paths to the cutscene
		#to_great_hall.enabled = false
	#else:
		#to_great_hall.enabled = true
		pass
		
