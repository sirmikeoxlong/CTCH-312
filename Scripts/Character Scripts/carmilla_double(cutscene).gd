extends CharacterBody2D

var speed = 100
var player_in_area = false
var player
var last_position: Vector2
var attack = false
var movement_dir

@onready var lauren_double_cutscene_: CharacterBody2D = $"../lauren_double(CUTSCENE)"
@onready var notice: AudioStreamPlayer2D = $notice

func _ready() -> void:
	last_position = position
	#notice.play()
	#await get_tree().create_timer(2.5).timeout
	#notice.stop()
	
func _physics_process(delta: float) -> void:
	movement_direction()
	
	if movement_dir == "left":
		$AnimatedSprite2D.play("idle left")
	if movement_dir == "right":
		$AnimatedSprite2D.play("idle right")
	if movement_dir == "up":
		$AnimatedSprite2D.play("idle up")
	if movement_dir == "right":
		$AnimatedSprite2D.play("idle right")
		
	if !player_in_area:
		position += (lauren_double_cutscene_.position - position) / speed
		
func movement_direction():
	if not lauren_double_cutscene_:
		return
		
	# Distance vector pointing from Carmilla to Lauren
	var diff = lauren_double_cutscene_.global_position - global_position
	
	# Compare absolute values to see if Lauren is further horizontally or vertically
	if abs(diff.x) > abs(diff.y):
		# Horizontal dominance
		if diff.x > 0:
			movement_dir = "right" # Lauren is to Carmilla's right
		else:
			movement_dir = "left"  # Lauren is to Carmilla's left
	else:
		# Vertical dominance
		if diff.y > 0:
			movement_dir = "down"  # Lauren is below Carmilla (Godot +Y is down)
		else:
			movement_dir = "up"    # Lauren is above Carmilla (Godot -Y is up)

func _on_detection_body_entered(body: CharacterBody2D) -> void:
	player_in_area = true


func _on_detection_body_exited(body: CharacterBody2D) -> void:
	player_in_area = false
