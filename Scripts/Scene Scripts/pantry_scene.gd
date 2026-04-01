extends Node2D

@onready var boot_room_key: cutscene_interactables = $"Boot Room Key"
@onready var to_kitchen: RoomTeleport = $"To Kitchen"
@onready var lauren: CharacterBody2D = $Lauren

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MusicManager.play_music(load("res://Sounds/AMBIENCE.ogg"))
	Global.lauren_movement_allowed = true
	lauren.global_position = get_node(Global.last_door_accessed).position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func unloack_all_doors():
	if Global.staff_room_key_collect == true:
		to_kitchen.unlocked = true

func _on_boot_room_key_body_entered(body: CharacterBody2D) -> void:
	boot_room_key.entered = true

func _on_boot_room_key_pocketed() -> void:
	boot_room_key.remove_from_scene()
	Global.boot_key_collect = true
