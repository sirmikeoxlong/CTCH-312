class_name RoomTeleport

extends Area2D

@export var teleport : String
@export var key : cutscene_interactables #change this to type key or interactable later
@export var unlocked = false
@export var forbidden_message : String
@onready var door_locked: AudioStreamPlayer2D = $door_locked
@onready var door_use: AudioStreamPlayer2D = $door_use

var entered


# Check if player has the key to unlock this door in inventory
func unlock():
	if key in SingPlayer.inventory:
		print("door unlocked")
		unlocked = true

func _on_body_entered(body: CharacterBody2D) -> void:
	entered = true

func _on_body_exited(body: CharacterBody2D) -> void:
	entered = false

func _process(delta: float) -> void:
	if entered == true:
		if Input.is_action_just_pressed("ui_accept"):
			unlock()
			if unlocked == true:
					door_use.play()
					await get_tree().create_timer(0.4).timeout
					Global.goto_scene(teleport)
			else:
				DialogueManager.show_dialogue_balloon(load("res://Dialogue/Carmilla's Manor.dialogue"), 
				forbidden_message)
				door_locked.play()
