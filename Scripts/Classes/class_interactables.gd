class_name cutscene_interactables

extends Node2D

@export var sprite : String
@export var collidable : Shape2D
@export var cutscene : Animation
@export var touched : bool = false

func trigger():
	# if player collided with this object, trigger the scene
	# probably a separate mask layer to do this
	pass
	
func perform():
	# if the above function returns true, perform the animation
	# once done, send a signal to the story singleton that the obj has been touched
	pass

func mark_as_touched():
	# signal that this specific interactable has been touched already
	# originally set as untouched
	pass
	
