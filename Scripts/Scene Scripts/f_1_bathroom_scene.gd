extends Node2D

@onready var library_piece_1: cutscene_interactables = $"Library Piece 1"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MusicManager.play_music(load("res://Sounds/AMBIENCE.ogg"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_library_piece_1_body_entered(body: Node2D) -> void:
	library_piece_1.entered = true

func _on_library_piece_1_pocketed() -> void:
	library_piece_1.remove_from_scene()
