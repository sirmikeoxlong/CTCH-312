extends Node2D

@onready var library_door_key_3: cutscene_interactables = $"Library Door Key 3"
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


func _on_library_door_key_3_body_entered(body: CharacterBody2D) -> void:
	library_door_key_3.entered = true


func _on_library_door_key_3_pocketed() -> void:
	library_door_key_3.remove_from_scene()
	Global.lib_key3_collect = true
