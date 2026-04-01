extends Node2D

@onready var bedroom_1_paper: cutscene_interactables = $"Bedroom 1 Paper"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_bedroom_1_paper_body_entered(body: CharacterBody2D) -> void:
	bedroom_1_paper.entered = true


func _on_bedroom_1_paper_pocketed() -> void:
	bedroom_1_paper.remove_from_scene()
	Global.bedroom1_key_pocketed = true
