extends Node2D

@onready var ballroom_paper: cutscene_interactables = $"Ballroom Paper"
@onready var snarky_comment: RoomTrigger = $"Dialogue/snarky comment"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MusicManager.play_music(load("res://Sounds/AMBIENCE.ogg"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_ballroom_paper_body_entered(body: CharacterBody2D) -> void:
	ballroom_paper.entered = true
	
func _on_ballroom_paper_pocketed() -> void:
	ballroom_paper.remove_from_scene()

func _on_snarky_comment_has_yapped_about_it() -> void:
	snarky_comment.remove_from_scene()
