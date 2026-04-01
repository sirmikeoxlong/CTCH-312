extends Node2D

@onready var staffroom_key: cutscene_interactables = $"Staffroom Key"
@onready var lauren: CharacterBody2D = $Lauren

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MusicManager.play_music(load("res://Sounds/AMBIENCE.ogg"))
	Global.lauren_movement_allowed = true
	lauren.global_position = get_node(Global.last_door_accessed).position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_staffroom_key_body_entered(body: CharacterBody2D) -> void:
	staffroom_key.entered = true


func _on_staffroom_key_pocketed() -> void:
	staffroom_key.remove_from_scene()
	Global.staff_room_key_collect = true
