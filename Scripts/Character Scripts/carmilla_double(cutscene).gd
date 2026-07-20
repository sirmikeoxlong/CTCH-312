extends CharacterBody2D

var speed = 50
var player_in_area = false
var player
var last_position: Vector2
var attack = false

@onready var player_sfx: AudioStreamPlayer2D = %player_sfx
@onready var footstep_timer: Timer = $player_sfx/footstep_timer

@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@export var move_speed : float = 200.0

@export var step_delay: float = 0.2

@onready var scream: AudioStreamPlayer2D = $scream
@onready var notice: AudioStreamPlayer2D = $notice
@onready var lauren: CharacterBody2D = $"../Lauren"
@onready var laurenbody: CollisionShape2D = $CollisionShape2D
@onready var killzone: Area2D = $Killzone


func _ready() -> void:
	last_position = position
	
func _physics_process(delta: float) -> void:
	pass
