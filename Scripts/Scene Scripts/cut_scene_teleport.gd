class_name CutsceneTeleporter

extends Area2D

#This item will teleport the player upon them entering the area2d body
# Function for loading the cutscene scene
# Function for removing this from a queue of cutscenes after it has been compelted (like the room dialogue)

@export var teleport : String

func _ready() -> void:
	if Global.completed_cutscenes.has(global_position):
		queue_free() #free the item becouse already has been collected
	else:
		Global.cutscenes.append(global_position)

func remove_from_scene():
	# signal to story state that this item has been picked up
	Global.completed_cutscenes.append(global_position)
	Global.cutscenes.erase(global_position)
	queue_free()
	print("remove_from_scene function working")
	# remove from the scene
	
func teleport_to_cutscene():
	print("teleport_to_cutscene() function working")
	Global.goto_scene(teleport)

#func _on_body_entered(body: CharacterBody2D) -> void:
	#if Global.cutscenes.has(global_position):
		#teleport_to_cutscene()
		#remove_from_scene()


func _on_body_entered(body: CharacterBody2D) -> void:
	if Global.cutscenes.has(global_position):
		teleport_to_cutscene()
		remove_from_scene()
