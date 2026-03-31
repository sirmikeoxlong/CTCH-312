class_name Puzzle

extends Area2D

@export var id : String
@export var item_puzzle_pieces : Array[Node2D]= []
@export var story_puzzle_piece	 : Array[Node2D] = []
@export var puzzle_puzzle_piece : Array[Puzzle] = []
@export var event : String
@export var unsolved_message : String

var detected_missing_piece = false

signal solved
signal pieces_collected

func _ready() -> void:
	if Global.completed_puzzles.has(global_position):
		queue_free() #free the item becouse already has been collected
	else:
		Global.puzzles.append(global_position)
		
func solve_puzzle() -> bool:
	
	# COMPLETED PUZZLE CHECK
	if !puzzle_puzzle_piece.is_empty():
		for i in range(puzzle_puzzle_piece.size()):
			if !Global.completed_puzzles.has(puzzle_puzzle_piece[i].id):
				detected_missing_piece = true
			else:
				detected_missing_piece = false
				
	# INVENTORY CHECK
	if !item_puzzle_pieces.is_empty():
		for i in range (item_puzzle_pieces.size()):
			if !Global.collectedItems.has(item_puzzle_pieces[i].id):
				#mark that something hasn't been collected
				detected_missing_piece = true
			else:
				detected_missing_piece = false
			
	# COMPLETED ROOM STORY CHECK
	if !story_puzzle_piece.is_empty():
		for i in range(story_puzzle_piece.size()):
			if !Global.completed_room_dialogue.has(story_puzzle_piece[i].id):
				detected_missing_piece = true
			else:
				detected_missing_piece = true

	
	print("Detected a Missing Puzzle Piece: ",detected_missing_piece)
	
	return detected_missing_piece
	
func perform_event():
	# After done, set the signal to true (emit)
	if Input.is_action_just_pressed("ui_accept"):
		if !detected_missing_piece:
			print("perform_event function working")
			DialogueManager.show_dialogue_balloon(load("res://Dialogue/Carmilla's Manor.dialogue"), 
			event)
		else:
			DialogueManager.show_dialogue_balloon(load("res://Dialogue/Carmilla's Manor.dialogue"), 
			unsolved_message)
	
func remove_from_scene():
	# signal to story state that this puzzle has been solved
	Global.completed_puzzles.append(global_position)
	Global.puzzles.erase(global_position)
	print("remove_from_scene function working")
	queue_free()
	
