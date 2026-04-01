extends Node2D

@onready var chapel_paper: cutscene_interactables = $"Chapel Paper"
@onready var painting: cutscene_interactables = $painting

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_chapel_paper_body_entered(body: CharacterBody2D) -> void:
	chapel_paper.entered = true


func _on_chapel_paper_pocketed() -> void:
	chapel_paper.remove_from_scene()


func _on_painting_body_entered(body: CharacterBody2D) -> void:
	painting.entered = true


func _on_painting_pocketed() -> void:
	painting.remove_from_scene()
