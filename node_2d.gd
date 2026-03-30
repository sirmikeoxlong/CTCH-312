class_name RoomTeleport

extends Area2D

@export var teleport : String

var entered

func _on_body_entered(body: CharacterBody2D) -> void:
	entered = true

func _on_body_exited(body: CharacterBody2D) -> void:
	entered = false

func _process(delta: float) -> void:
	if entered == true:
		if Input.is_action_just_pressed("ui_accept"):
			Global.goto_scene(teleport)
