extends Node2D

@onready var lauren: CharacterBody2D = $Lauren

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.carmilla_movement_allowed = false
	lauren.disable_camera()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_carmilla_now_enters_has_yapped_about_it() -> void:
	$"Carmilla Entrance".play("Enter")


func _on_go_hide_has_yapped_about_it() -> void:
	$"Light Move".play("move")
