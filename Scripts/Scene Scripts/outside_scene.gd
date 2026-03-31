extends Node2D

@onready var trigger_scene_1_forest_1: CollisionShape2D = $Area2D/trigger_scene1forest1
@onready var key1 = $"Main Door Key"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
# if player passes through the collision, trigger the dialogue
# also make the camera zoom out to look at the mansion in full?


func _on_main_door_key_body_entered(body: CharacterBody2D) -> void:
	key1.entered = true


func _on_main_door_key_body_exited(body: Node2D) -> void:
	print("exited")

func _on_main_door_key_pocketed() -> void:
	key1.remove_from_scene()
	#key1.queue_free()
