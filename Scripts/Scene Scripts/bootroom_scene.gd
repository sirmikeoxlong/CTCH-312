extends Node2D

@onready var spare_bedroom_key: cutscene_interactables = $"Spare Bedroom Key"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_spare_bedroom_key_body_entered(body: Node2D) -> void:
	spare_bedroom_key.entered = true


func _on_spare_bedroom_key_pocketed() -> void:
	spare_bedroom_key.remove_from_scene()
	Global.spare_bed_key = true
