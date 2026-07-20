extends CharacterBody2D

const JUMP_VELOCITY = -400.0
const SUM = 50;

var speed = 80.0
var closet_entered = false
var input_dir = Vector2.ZERO
var movement_dir = ""
var can_flashbang = true
var curr_flashing = false
var is_hit = false
var is_flashing_anim = false
var is_crouching = false

@onready var animation_player: AnimationPlayer = $AnimationPlayer
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
@onready var heal_sfx: AudioStreamPlayer = $HEAL_SFX
@onready var hpbar: CanvasLayer = $Hpbar
@onready var hit_sfx: AudioStreamPlayer = $hit_sfx
@onready var death_timer: Timer = $death_timer



func player():
	pass

func _ready() -> void:
	$AnimatedSprite2D.play("Idle Right")

func _physics_process(delta: float) -> void:
	movement_enabled = Global.lauren_movement_allowed
	#movement_enabled = !Storystate.in_dialogue
	if movement_enabled == true:
		move_and_slide()
		player_movement()
		movement_direction()
		player_animation()
	else:
		$AnimatedSprite2D.play("Idle")
		
		
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
	if is_hit or is_flashing_anim:
		return #prevent overiding hit animation
	
	if velocity:
		if movement_dir == "left":
			animated_sprite.flip_h = false
			$AnimatedSprite2D.play("Walking Left")
		elif movement_dir == "right":
			animated_sprite.flip_h = false
			$AnimatedSprite2D.play("Walking Right")
		elif movement_dir == "up":
			animated_sprite.flip_h = false
			$AnimatedSprite2D.play("Walking Up")
		elif movement_dir == "down":
			animated_sprite.flip_h = false
			$AnimatedSprite2D.play("Walking Down")
	else:
		if movement_dir == "left":
			animated_sprite.flip_h = false
			$AnimatedSprite2D.play("Idle Left")
		elif movement_dir == "right":
			animated_sprite.flip_h = false
			$AnimatedSprite2D.play("Idle Right")
		elif movement_dir == "up":
			animated_sprite.flip_h = false
			$AnimatedSprite2D.play("Idle Up")
		elif movement_dir == "down":
			animated_sprite.flip_h = false
			$AnimatedSprite2D.play("Idle")
		
	
func _input(event) -> void:
		
# Handle running
	if event.is_action_pressed("run"):
		speed = 200
	if event.is_action_released("run"):
		speed = 80
# Added a test comment
		
# Handle Crouching/ running crouch stuff
	if event.is_action_pressed("crouch"):
		is_crouching = true
		speed = 30
			
	if event.is_action_released("crouch"):
		is_crouching = false
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


func disable_movement():
	movement_enabled = false
	#Global.lauren_movement_allowed = false

func enable_movement():
	movement_enabled = true
	#Global.lauren_movement_allowed = true
	
	
#extends CharacterBody2D
#
#var input_dir = Vector2.ZERO
#
#func _ready() -> void:
	#$AnimatedSprite2D.play("Idle Right")
	#
#func _physics_process(delta: float) -> void:
	#pass
#
#func player_movement():
	#input_dir = Input.get_vector("left", "right", "up", "down")
	#velocity = input_dir * speed 
