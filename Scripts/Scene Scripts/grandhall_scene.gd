extends Node2D

@onready var d_scene_5_enter_1: RoomTrigger = $Dialogue/d_scene5enter1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_class_room_trigger_has_yapped_about_it() -> void:
	d_scene_5_enter_1.remove_from_scene()
	print("_on_class_room_trigger_has_yapped_about_it function working")
