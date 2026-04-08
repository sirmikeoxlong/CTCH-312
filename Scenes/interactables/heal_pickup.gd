extends Area2D

var entered = false
var lauren: CharacterBody2D = null

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		entered = true
		lauren = body

func _process(delta: float) -> void:
	if entered and lauren and Input.is_action_just_pressed("Interact"):
		lauren.heal_pickup()
		queue_free()

func _on_body_exited(body: Node2D) -> void:
	if body == lauren:
		entered = false
		lauren = null
