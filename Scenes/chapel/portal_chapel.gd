extends Area2D

var entered
@export var teleport : String

func _on_body_entered(body: CharacterBody2D) -> void:
	entered = true

func _on_body_exited(body: Node2D) -> void:
	entered = false

func _process(delta: float) -> void:
	if entered == true:
		if Input.is_action_just_pressed("Interact"):
			Global.goto_scene(teleport)
