extends CharacterBody2D

const JUMP_VELOCITY = -400.0
const SUM = 50;

var speed = 80.0
var closet_entered = false
var input_dir = Vector2.ZERO
var movement_dir = ""
var movement_enabled = true

@onready var lightPivot = $LightPivot
@onready var flashlight = $LightPivot/Area2D/Flashlight
@onready var light = $LightPivot/Area2D/Flashlight/FlashbangPath
@onready var animated_sprite = $AnimatedSprite2D


func player():
	pass

func _ready() -> void:
	$AnimatedSprite2D.play("Idle")

func _physics_process(delta: float) -> void:
		move_and_slide()
		player_movement()
		movement_direction()
		player_animation()
		
func player_movement():
	if movement_enabled == true:
		input_dir = Input.get_vector("left", "right", "up", "down")
		velocity = input_dir * speed 
	else:
		speed = 0.0
	
func movement_direction():
	if Input.is_action_just_pressed("left"):
		movement_dir = "left"
	if Input.is_action_just_pressed("right"):
		movement_dir = "right"
	if Input.is_action_just_pressed("up"):
		movement_dir = "up"
	if Input.is_action_just_pressed("down"):
		movement_dir = "down"

func player_animation():
	if velocity:
		if movement_dir == "left":
			$AnimatedSprite2D.play("Walking Left")
		elif movement_dir == "right":
			$AnimatedSprite2D.play("Walking Right")
		elif movement_dir == "up":
			$AnimatedSprite2D.play("Walking Up")
		elif movement_dir == "down":
			$AnimatedSprite2D.play("Walking Down")
	else:
		if movement_dir == "left":
			$AnimatedSprite2D.play("Idle Left")
		elif movement_dir == "right":
			$AnimatedSprite2D.play("Idle Right")
		elif movement_dir == "up":
			$AnimatedSprite2D.play("Idle Up")
		elif movement_dir == "down":
			$AnimatedSprite2D.play("Idle")
		
	
func _input(event) -> void:
	
# Handle flashlight direction
	if event.is_action_pressed("left"):
		lightPivot.set_rotation_degrees(90)
		lightPivot.set_position(Vector2(-25.0, 6.0))
	if event.is_action_pressed("right"):
		lightPivot.set_rotation_degrees(270)
		lightPivot.set_position(Vector2(25.0, 6.0))
	if event.is_action_pressed("up"):
		lightPivot.set_rotation_degrees(180)
		lightPivot.set_position(Vector2(0.0, -26.0))
	if event.is_action_pressed("down"):
		lightPivot.set_rotation_degrees(0)
		lightPivot.set_position(Vector2(0.0, 26.0))
		
# Handle running
	if event.is_action_pressed("run"):
		speed = 200
	if event.is_action_released("run"):
		speed = 80
# Added a test comment
		
# Handle Crouching/ running crouch stuff
	if event.is_action_pressed("crouch"):
		speed = 30
	if event.is_action_released("crouch"):
		speed = 80
	if event.is_action_pressed("running_crouch"):
		speed = 60
	if event.is_action_released("running_crouch"):
		speed = 80

# Handle closet hiding
	if closet_entered == true:
		# Make her sprite dissapear + Point light diminish or dissapear
		if event.is_action_pressed("hide"):
			#$CollisionShape2D.disabled = true
			movement_enabled = false
			$AnimatedSprite2D.visible = false
		if event.is_action_released("hide"):
			#$CollisionShape2D.disabled = false
			movement_enabled = true
			$AnimatedSprite2D.visible = true

# Handle flashbang
# Add an enable/disabler thing rather than scaling
	if event.is_action_pressed("flashbang"):
		flashlight.disabled = false
		light.visible = true
	if event.is_action_released("flashbang"):
		flashlight.disabled = true
		light.visible = false


# Handle hiding
	# if hide key is pressed, Lauren's Sprite dissapears and
	# her collission either shrinks or dissapears enough that
	# none of the NPCs can detect her
	# I think this is probably gonna be a signal from the character to 
	# another node?
	


func _on_closet_1_body_entered(body: CharacterBody2D) -> void:
	closet_entered = true

func _on_closet_1_body_exited(body: Node2D) -> void:
	closet_entered = false
	
# Handle flashbang
	# if flashbang button pressed
	# Lauren should enter her flashlight animation (for that direction)
	# The screen should immediately flash white
	# Carmilla should enter her stunned state (8 seconds)
		
