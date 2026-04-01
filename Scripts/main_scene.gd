extends Control

@onready var health = 5
@onready var main_menu_theme: AudioStreamPlayer2D = $MainMenuTheme

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main_menu_theme.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
