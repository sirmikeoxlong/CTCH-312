extends Node2D

@onready var boot_room_key: cutscene_interactables = $"Boot Room Key"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_boot_room_key_body_entered(body: CharacterBody2D) -> void:
	boot_room_key.entered = true

func _on_boot_room_key_pocketed() -> void:
	boot_room_key.remove_from_scene()
	Global.boot_key_collect = true
