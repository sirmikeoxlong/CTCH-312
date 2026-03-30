extends CharacterBody2D

var speed = 50
var player_in_area = false
var player

func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	$Detection/CollisionShape2D.disabled = false
	if player_in_area:
		position += (player.position - position) / speed
		$AnimatedSprite2D.play("move")
	else:
		$AnimatedSprite2D.play("idle")

func _on_detection_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = true
		player = body

func _on_detection_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = false
