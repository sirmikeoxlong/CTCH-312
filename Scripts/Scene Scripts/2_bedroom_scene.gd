extends Node2D

@onready var lockpick: cutscene_interactables = $Lockpick
@onready var lauren: CharacterBody2D = $"Environmental Sorting/Lauren"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MusicManager.play_music(load("res://Sounds/AMBIENCE.ogg"))
	Global.lauren_movement_allowed = true
	lauren.global_position = get_node(Global.last_door_accessed).position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_lockpick_pocketed() -> void:
	lockpick.remove_from_scene()
	Global.lockpick_pocketed = true


func _on_lockpick_body_entered(body: Node2D) -> void:
	lockpick.entered = true
