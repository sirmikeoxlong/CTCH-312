extends Button

@onready var ui: AudioStreamPlayer2D = $"../UI"
@onready var main_menu_theme: AudioStreamPlayer2D = $"../../MainMenuTheme"



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _on_pressed() -> void:
	ui.play()
	await get_tree().create_timer(0.67).timeout
	Global.goto_scene("res://Scenes/Playable Scenes/outside_scene.tscn")
