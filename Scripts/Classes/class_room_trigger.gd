class_name RoomTrigger

extends Area2D

signal has_yapped_about_it

@export var id : String
@export var RoomMessage : String

func _ready() -> void:
	if Global.completed_room_dialogue.has(global_position):
		queue_free() #free the item becouse already has been collected
	else:
		Global.dialogue.append(global_position)

func remove_from_scene():
	# signal to story state that this item has been picked up
	Global.completed_room_dialogue.append(global_position)
	Global.dialogue.erase(global_position)
	queue_free()
	print("remove_from_scene function working")
	# remove from the scene
	
func say_room_dialogue():
	# Function where Lauren yaps
	# After done, set the signal to true (emit)
	print("say_room_dialogue function working")
	DialogueManager.show_dialogue_balloon(load("res://Dialogue/Carmilla's Manor.dialogue"), 
	RoomMessage)
	

func _on_body_entered(body: CharacterBody2D) -> void:
	if Global.dialogue.has(global_position):
		# if character enters here for the first time, trigger the necessary scene
		# once done, this dialogue has to be deqeued from the scene
		print("_on_body_entered function working")
		say_room_dialogue()
		has_yapped_about_it.emit()
		remove_from_scene()
		
