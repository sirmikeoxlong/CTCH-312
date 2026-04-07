extends CharacterBody2D

const JUMP_VELOCITY = -400.0
const SUM = 50;

var speed = 80.0
var closet_entered = false
var input_dir = Vector2.ZERO
var movement_dir = ""
var can_flashbang = true

@onready var flashlight_click: AudioStreamPlayer = $FlashlightClick
@onready var movement_enabled = Global.lauren_movement_allowed
@onready var lightPivot = $LightPivot
@onready var flashlight = $LightPivot/Area2D/Flashlight
@onready var light = $LightPivot/Area2D/Flashlight/FlashbangPath
@onready var animated_sprite = $AnimatedSprite2D
@onready var player_sfx: AudioStreamPlayer2D = %player_sfx
@onready var footstep_timer: Timer = $player_sfx/footstep_timer
@export var step_delay: float = 0.
@onready var camera_2d: Camera2D = $Camera2D
@onready var flash_timer: Timer = $LightPivot/Area2D/Flashlight/FlashbangPath/flash_timer
@onready var flashlight_bang: AudioStreamPlayer = $LightPivot/Area2D/Flashlight/FlashbangPath/FlashlightBang
@onready var flashlighton: Sprite2D = $Flashlighton
@onready var flashlightoff: Sprite2D = $Flashlightoff



func player():
	pass

func _ready() -> void:
	$AnimatedSprite2D.play("Idle")

func _physics_process(delta: float) -> void:
	movement_enabled = Global.lauren_movement_allowed
	if movement_enabled == true:
		move_and_slide()
		player_movement()
		movement_direction()
		player_animation()
		
		  # Check if the player is moving and on the floor
		if velocity.length() > 0 :
			if $player_sfx/footstep_timer.is_stopped():
				$player_sfx/footstep_timer.start()
		else:
			$player_sfx/footstep_timer.stop()
	else:
		pass

func _on_footstep_timer_timeout():
	# Play the sound when the timer times out
	if velocity.length() > 0 :
			player_sfx.play()
		
		
func player_movement():
	if movement_enabled == true:
		input_dir = Input.get_vector("left", "right", "up", "down")
		velocity = input_dir * speed 
	else:
		speed = 0.0

func disable_camera():
	camera_2d.queue_free()
		
	
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
			disable_movement()
			$AnimatedSprite2D.visible = false
		if event.is_action_released("hide"):
			#$CollisionShape2D.disabled = false
			enable_movement()
			$AnimatedSprite2D.visible = true

# Handle flashbang
# Add an enable/disabler thing rather than scaling
#can_flashbang is the variable to connect the timeout function
		
	if event.is_action_pressed("flashbang") and can_flashbang:
		can_flashbang = false
		flashlight.disabled = false
		light.visible = true
		flashlight_bang.play()
		flash_timer.start()
		flashlightoff.hide()
		flashlighton.show()
	if event.is_action_released("flashbang"):
		flashlight.disabled = true
		light.visible = false
		flashlighton.hide()
		flashlightoff.show()


func disable_movement():
	movement_enabled = false
	#Global.lauren_movement_allowed = false

func enable_movement():
	movement_enabled = true
	#Global.lauren_movement_allowed = true


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
	
#connect timer timeout to flash
func _on_flash_timer_timeout() -> void:
	can_flashbang = true
	flashlighton.show()
	flashlight_click.play()
