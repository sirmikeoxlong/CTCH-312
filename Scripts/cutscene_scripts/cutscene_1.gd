extends Node2D

@onready var lauren: CharacterBody2D = $Lauren

var last_door = Global.last_door_accessed

# Called wh$Camera2Den the node enters the scene tree for the first time.
func _ready() -> void:
	Global.lauren_movement_allowed = true
	Global.carmilla_movement_allowed = false
	
	if !(last_door == ""):
		lauren.global_position = get_node(Global.last_door_accessed).position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_snarky_comment_body_entered(body: CharacterBody2D) -> void:
	Global.lauren_movement_allowed = false
	#Global.carmilla_movement_allowed = false

func _on_front_door_has_yapped_about_it() -> void:
	# Carmilla should move away
	# wait a bit
	# Once Lauren goes through the hall, transport he to the next cutscene
	$AnimationPlayer.play("new_animation")
	await get_tree().create_timer(2.5).timeout
	DialogueManager.show_dialogue_balloon(load("res://Dialogue/Carmilla's Manor.dialogue"), 
	"followcarmilla")
	await get_tree().create_timer(2.5).timeout
	Global.cutscene_1_completed = true
	Global.goto_scene("res://Scenes/Playable Scenes/f_2_library_scene.tscn")
