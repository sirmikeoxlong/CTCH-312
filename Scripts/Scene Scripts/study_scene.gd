extends Node2D


@onready var study: RoomTeleport = $Study
@onready var father_s_journal: cutscene_interactables = $"Father's Journal"
@onready var f_2_bathroom_key: cutscene_interactables = $"F2 Bathroom Key"
@onready var lauren: CharacterBody2D = $Lauren

var last_door = Global.last_door_accessed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.player_curr_pos = lauren.position
	study.unlocked = false
	MusicManager.play_music(load("res://Sounds/AMBIENCE.ogg"))
	Global.lauren_movement_allowed = true
	
	if !(last_door == ""):
		lauren.global_position = get_node(Global.last_door_accessed).position
	
func force_player_to_study():
	if Global.fathers_journal_pocketed == true:
		study.unlocked = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	force_player_to_study()


func _on_fathers_journal_body_entered(body: CharacterBody2D) -> void:
	father_s_journal.entered = true


func _on_fathers_journal_pocketed() -> void:
	father_s_journal.remove_from_scene()
	Global.fathers_journal_pocketed = true
	StateCarmilla.call_for_spawn = true
	

func _on_f_2_bathroom_key_body_entered(body: CharacterBody2D) -> void:
	f_2_bathroom_key.entered = true

func _on_f_2_bathroom_key_pocketed() -> void:
	f_2_bathroom_key.remove_from_scene()
	Global.f2_bathroom_key_pocketed = true
