extends Node2D
@onready var carmilla: CharacterBody2D = $Carmilla
@onready var lauren: CharacterBody2D = $"Environmental Sorting/Lauren"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lauren.disable_camera()
	StateCarmilla.carmilla_curr_dialogue = true
	Global.carmilla_movement_allowed = false
	Global.lauren_movement_allowed = false
	await DialogueManager.show_dialogue_balloon(load("res://Dialogue/Carmilla's Manor.dialogue"), "scene39carmillaroom1").tree_exited


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
