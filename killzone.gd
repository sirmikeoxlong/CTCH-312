extends Area2D

@onready var timer: Timer = $Timer
@onready var carmilla: CharacterBody2D = $".."


func _on_body_entered(body: Node2D) -> void:
	print("get smacked")
	#carmilla.speed = 0
	body.hit() 


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()


func _on_body_exited(body: Node2D) -> void:
	pass
	#carmilla.speed = 50
