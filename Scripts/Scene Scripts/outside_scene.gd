extends Node2D

@onready var lauren: CharacterBody2D = $Lauren
@onready var trigger_scene_1_forest_1: CollisionShape2D = $Area2D/trigger_scene1forest1
@onready var key1 = $"Main Door Key"
@onready var outdoor_amb: AudioStreamPlayer = $OutdoorAMB

var last_door = Global.last_door_accessed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	outdoor_amb.play()
	if !(last_door == ""):
		lauren.global_position = get_node(last_door).position
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
# if player passes through the collision, trigger the dialogue
# also make the camera zoom out to look at the mansion in full?


func _on_main_door_key_body_entered(body: CharacterBody2D) -> void:
	key1.entered = true


func _on_main_door_key_body_exited(body: Node2D) -> void:
	print("exited")
	key1.entered = false


func _on_main_door_key_pocketed() -> void:
	key1.remove_from_scene()
	#key1.queue_free()
