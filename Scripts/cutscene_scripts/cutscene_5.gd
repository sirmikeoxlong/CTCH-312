extends Node2D
@onready var light_move: AnimationPlayer = $"Light Move"
@onready var room_shakes: AnimationPlayer = $"ROOM SHAKES"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	light_move.play("move")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_trigger_shake_body_entered(body: CharacterBody2D) -> void:
	Global.lauren_movement_allowed = false
	DialogueManager.show_dialogue_balloon(load("res://Dialogue/Carmilla's Manor.dialogue"), "earth_quake")
	room_shakes.play("shake")
	await get_tree().create_timer(5).timeout
	DialogueManager.show_dialogue_balloon(load("res://Dialogue/Carmilla's Manor.dialogue"), "library_door_open")
	Global.lauren_movement_allowed = true
	
