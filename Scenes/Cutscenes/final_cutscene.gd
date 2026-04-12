extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await DialogueManager.show_dialogue_balloon(load("res://Dialogue/Carmilla's Manor.dialogue"), "flashbackyear").tree_exited
	Global.goto_scene("res://Scenes/Cutscenes/showdown.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
