extends Node2D

@onready var billiards_paper: cutscene_interactables = $"Billiards Paper"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_billiards_paper_body_entered(body: CharacterBody2D) -> void:
	billiards_paper.entered = true


func _on_billiards_paper_pocketed() -> void:
	billiards_paper.remove_from_scene()
