extends Node2D
@onready var lauren: CharacterBody2D = $"Environmental Sorting/Lauren"

var last_door = Global.last_door_accessed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.lauren_movement_allowed = true
	
	if !(last_door == ""):
		lauren.global_position = get_node(Global.last_door_accessed).position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
