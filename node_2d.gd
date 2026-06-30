#This class handles room teleportation... it updates the last room accessed if the player
#enters the door, which is presumably unlocked.

class_name RoomTeleport

extends Area2D

@export var teleport : String
@export var key : cutscene_interactables #change this to type key or interactable later
@export var unlocked = false
@export var forbidden_message : String = "doorlock"
@export var door_id : String

@onready var door_locked: AudioStreamPlayer2D = $door_locked
@onready var door_use: AudioStreamPlayer2D = $door_use
@onready var lauren: CharacterBody2D = $"../Lauren"

var d_Resource = load("res://Dialogue/Carmilla's Manor.dialogue")

var entered	

func _ready() -> void:
	pass

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
		if Input.is_action_just_pressed("Talk"):
			Global.lauren_movement_allowed = false
			unlock()
			if unlocked == true:
					print("door is unlocked")
					door_use.play()
					Global.last_door_accessed = self.name
					await get_tree().create_timer(0.4).timeout
					print("Global.last_door_accessed has been updated")
					Global.goto_scene(teleport)
					pass
			else:
				DialogueManager.show_dialogue_balloon(d_Resource, forbidden_message)
				door_locked.play()
				await get_tree().create_timer(2.5).timeout
				Global.lauren_movement_allowed = true
