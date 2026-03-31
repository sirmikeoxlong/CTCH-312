extends Node2D

@onready var trigger_scene_1_forest_1: CollisionShape2D = $Area2D/trigger_scene1forest1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
# if player passes through the collision, trigger the dialogue
# also make the camera zoom out to look at the mansion in full?
