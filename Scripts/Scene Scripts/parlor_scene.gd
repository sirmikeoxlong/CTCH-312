extends Node2D

@onready var ballroom_paper: cutscene_interactables = $"Ballroom Paper"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_ballroom_paper_body_entered(body: Node2D) -> void:
	ballroom_paper.entered = true
	
func _on_ballroom_paper_pocketed() -> void:
	ballroom_paper.remove_from_scene()
