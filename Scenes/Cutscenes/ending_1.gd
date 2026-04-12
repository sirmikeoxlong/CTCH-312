extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await DialogueManager.show_dialogue_balloon(load("res://Dialogue/Carmilla's Manor.dialogue"), "scene40parenthouse1").tree_exited


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
