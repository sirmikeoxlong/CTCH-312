extends Node2D

@onready var lockpick: cutscene_interactables = $Lockpick

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_lockpick_pocketed() -> void:
	lockpick.remove_from_scene()
	Global.lockpick_pocketed = true


func _on_lockpick_body_entered(body: Node2D) -> void:
	lockpick.entered = true
