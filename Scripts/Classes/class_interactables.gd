class_name cutscene_interactables

extends Node2D

signal pocketed
@onready var entered

func _process(delta: float) -> void:
	mark_as_touched()

func trigger():
	# if player collided with this object, trigger the scene
	# probably a separate mask layer to do this
	pass
	
func perform():
	# if the above function returns true, perform the animation
	# once done, send a signal to the story singleton that the obj has been touched
	pass

func mark_as_touched():
	if entered == true:
		if Input.is_action_just_pressed("ui_accept"):
			add_to_inventory()
	else:
		pass

func add_to_inventory():
	# add an item of this class to global inventory
	SingPlayer.inventory.push_front(self)
	DialogueManager.show_dialogue_balloon(load("res://Dialogue/Carmilla's Manor.dialogue"), "scene1forest2")
	self.hide()
	pocketed.emit()

func remove_from_scene():
	# signal to story state that this item has been picked up
	Storystate.picked_first_gate_key = true
	# remove from the scene
	
	

	
