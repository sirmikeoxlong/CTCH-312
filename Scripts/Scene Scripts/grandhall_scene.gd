extends Node2D

@onready var d_scene_5_enter_1: RoomTrigger = $Dialogue/d_scene5enter1
@onready var library_door_puzzle: Puzzle = $"Library Door Puzzle"
@onready var class_room_teleport: RoomTeleport = $Doors/ClassRoomTeleport
@onready var key_1: cutscene_interactables = $"Key 1"



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	class_room_teleport.set_process(false)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_class_room_trigger_has_yapped_about_it() -> void:
	d_scene_5_enter_1.remove_from_scene()
	print("_on_class_room_trigger_has_yapped_about_it function working")

func _on_class_puzzle_body_entered(body: CharacterBody2D) -> void:
	#if character has entered here and they have met the criteria, 
	# the event will trigger
	print("_on_class_puzzle_body_entered function entered")
	if library_door_puzzle.solve_puzzle() == false:
		library_door_puzzle.perform_event()
		library_door_puzzle.remove_from_scene()
		class_room_teleport.set_process(true)
	else:
		pass

func _on_pickup_body_entered(body: Node2D) -> void:
	key_1.entered = true

func _on_pickup_pocketed() -> void:
	key_1.remove_from_scene()
