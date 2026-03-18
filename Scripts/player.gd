extends CharacterBody2D


var SPEED = 80.0
const JUMP_VELOCITY = -400.0
const SUM = 50;


func _physics_process(delta: float) -> void:
	## Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var x_direction := Input.get_axis("ui_left", "ui_right")
	if x_direction:
		velocity.x = x_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	# Handling Up and Down keys
	var y_direction := Input.get_axis("ui_down", "ui_up")
	if y_direction:
		velocity.y = y_direction * -SPEED
	else:
		# if I removwe this, bro turns into a ping pong ball :3
		velocity.y = move_toward(velocity.y, 0, SPEED) 

	move_and_slide()
	
func _input(event):
# Handle running
	if event.is_action_pressed("run"):
		SPEED = 200
	if event.is_action_released("run"):
		SPEED = 80
# Handle Crouching
	if event.is_action_pressed("crouch"):
		SPEED = 30
	if event.is_action_released("crouch"):
		SPEED = 80
	if event.is_action_pressed("running_crouch"):
		SPEED = 60
	if event.is_action_released("running_crouch"):
		SPEED = 80
	
	
