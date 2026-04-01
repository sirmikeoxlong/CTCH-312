class_name cutscene_interactables

extends Node2D

@export var id : String
@export var pickup_message : String
@onready var key_main: AudioStreamPlayer2D = $key_main


@onready var entered

signal pocketed

func _ready() -> void:
	if Global.collectedItems.has(id):
		queue_free() #free the item becouse already has been collected
	else:
		Global.items.append(id)

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
		add_to_inventory()
	else:
		pass

func add_to_inventory():
	# add an item of this class to global inventory
	if Input.is_action_just_pressed("ui_accept"):
		key_main.stop()
		key_main.play()
		SingPlayer.inventory.push_front(self)
		DialogueManager.show_dialogue_balloon(load("res://Dialogue/Carmilla's Manor.dialogue"), 
		pickup_message)
		self.hide()
		pocketed.emit()

func remove_from_scene():
	# signal to story state that this item has been picked up
	Storystate.picked_first_gate_key = true
	Global.collectedItems.append(id)
	Global.items.erase(id)
	queue_free()
	# remove from the scene
