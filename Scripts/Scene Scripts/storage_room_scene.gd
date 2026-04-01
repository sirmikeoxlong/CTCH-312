extends Node2D

@onready var staffroom_key: cutscene_interactables = $"Staffroom Key"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_staffroom_key_body_entered(body: CharacterBody2D) -> void:
	staffroom_key.entered = true


func _on_staffroom_key_pocketed() -> void:
	staffroom_key.remove_from_scene()
	Global.staff_room_key_collect = true
