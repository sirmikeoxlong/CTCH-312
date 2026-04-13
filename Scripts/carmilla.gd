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
	footstep_timer.wait_time = step_delay
	
func _physics_process(delta: float) -> void:
	#var current_position: Vector2 = self.global_transform.origin
	#var next_path_position: Vector2 = navigation_agent_2d.get_next_path_position()
	#var new_velocity: Vector2 = current_position.direction_to(next_path_position)
	#navigation_agent_2d.velocity = new_velocity
	#update_target_position(lauren.global_transform.origin)
	
	
	
	$Detection/CollisionShape2D.disabled = false
	if attack:
		return  # 🔥 stop movement + animation override
	if player_in_area:
		if Global.carmilla_movement_allowed:
			position += (player.position - position) / speed
			$AnimatedSprite2D.play("left")
	else:
		$AnimatedSprite2D.play("idle")

 # Check if the player is moving and on the floor
	var is_moving = position.distance_to(last_position) > 0.2

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
		scream.play()
		notice.play()

func _on_detection_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = false
		scream.stop()
		notice.stop()


func update_target_position(target_pos: Vector2):
	navigation_agent_2d.target_position = target_pos

func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
	velocity = velocity.move_toward(safe_velocity * move_speed, 12.0)
	move_and_slide()



func _on_killzone_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		attack = true
		$AnimatedSprite2D.play("attack")
		

func _on_animated_sprite_2d_animation_finished() -> void:
	if $AnimatedSprite2D.animation == "attack":
		attack = false
