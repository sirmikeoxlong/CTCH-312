extends Node2D

@onready var carmilla_s_room: RoomTeleport = $"Carmilla's Room"
@onready var carmilla_s_diary: cutscene_interactables = $"Carmilla's Diary"
@onready var lauren: CharacterBody2D = $Lauren

var last_door = Global.last_door_accessed


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MusicManager.play_music(load("res://Sounds/AMBIENCE.ogg"))
	Global.lauren_movement_allowed = true
	
	if !(last_door == ""):
		lauren.global_position = get_node(Global.last_door_accessed).position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	force_player_to_study()
	
func force_player_to_study():
	if Global.carmilla_diary_pocketed == true:
		carmilla_s_room.unlocked = true


func _on_carmillas_diary_body_entered(body: CharacterBody2D) -> void:
	carmilla_s_diary.entered = true


func _on_carmillas_diary_pocketed() -> void:
	carmilla_s_diary.remove_from_scene()
	Global.carmilla_diary_pocketed = true
	Global.lib_key2_collect = true
	Global.storage_room_key_allowed = true
	

func _on_carmillas_diary_saying_finished() -> void:
	DialogueManager.show_dialogue_balloon(load("res://Dialogue/Carmilla's Manor.dialogue"), 
	"puzzlepiece1")
	Global.goto_scene("res://Scenes/Cutscenes/cutscene_3.tscn")


func _on_main_door_key_body_entered(body: Node2D) -> void:
	$"Storage Key".entered = true
	
func _on_storage_key_body_exited(body: Node2D) -> void:
	$"Storage Key".entered = false

func _on_main_door_key_pocketed() -> void:
	$"Storage Key".remove_from_scene()

func _on_library_piece_1_body_entered(body: Node2D) -> void:
	$"Library Piece 1".entered = true
	
func _on_library_piece_1_body_exited(body: Node2D) -> void:
	$"Library Piece 1".entered = false
	
func _on_library_piece_1_pocketed() -> void:
	$"Library Piece 1".remove_from_scene()
