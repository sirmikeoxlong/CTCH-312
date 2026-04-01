extends Node2D

@onready var dining_paper: cutscene_interactables = $"Dining Paper"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_dining_paper_body_entered(body: Node2D) -> void:
	dining_paper.entered = true
	

func _on_dining_paper_pocketed() -> void:
	dining_paper.remove_from_scene()
