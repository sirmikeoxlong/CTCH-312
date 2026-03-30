extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_pressed() -> void:
	Global.goto_scene("res://Scenes/Playable Scenes/outside_scene.tscn")
