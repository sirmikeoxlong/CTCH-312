extends CharacterBody2D

var speed = 50
var player_in_area = false
var player
var last_position: Vector2

@onready var player_sfx: AudioStreamPlayer2D = %player_sfx
@onready var footstep_timer: Timer = $player_sfx/footstep_timer
@export var step_delay: float = 0.4


func _ready() -> void:
	last_position = position
	footstep_timer.wait_time = step_delay
	
func _physics_process(delta: float) -> void:
	$Detection/CollisionShape2D.disabled = false
	if player_in_area:
		position += (player.position - position) / speed
		$AnimatedSprite2D.play("left")
	else:
		$AnimatedSprite2D.play("idle")

 # Check if the player is moving and on the floor
	var is_moving = position.distance_to(last_position) > 0.5

	if is_moving:
		if footstep_timer.is_stopped():
			footstep_timer.start()
	else:
			footstep_timer.stop()
	last_position = position

func _on_footstep_timer_timeout():
	player_sfx.pitch_scale = randf_range(0.9, 1.1)
	player_sfx.play()



func _on_detection_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = true
		player = body

func _on_detection_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = false
