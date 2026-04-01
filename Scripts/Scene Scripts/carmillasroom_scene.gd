extends Node2D

@onready var to_f_2_library_hall: RoomTeleport = $"To F2 Library Hall"
@onready var carmilla_s_diary: cutscene_interactables = $"Carmilla's Diary"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MusicManager.play_music(load("res://Sounds/AMBIENCE.ogg"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	force_player_to_study()
	
func force_player_to_study():
	if Global.carmilla_diary_pocketed == true:
		to_f_2_library_hall.unlocked = true


func _on_carmillas_diary_body_entered(body: CharacterBody2D) -> void:
	carmilla_s_diary.entered = true


func _on_carmillas_diary_pocketed() -> void:
	carmilla_s_diary.remove_from_scene()
	Global.carmilla_diary_pocketed = true
	Global.lib_key2_collect = true
	Global.storage_room_key_allowed = true
	DialogueManager.show_dialogue_balloon(load("res://Dialogue/Carmilla's Manor.dialogue"), "puzzlepiece1")
