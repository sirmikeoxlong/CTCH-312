extends Area2D

func _on_body_entered(body: CharacterBody2D) -> void:
	if Storystate.has_started_scene1 == false:
	# if character enters here for the first time, trigger the necessary scene
		DialogueManager.show_dialogue_balloon(load("res://Dialogue/Carmilla's Manor.dialogue"), 
		"scene1forest1")
		Storystate.has_started_scene1 = true
	
