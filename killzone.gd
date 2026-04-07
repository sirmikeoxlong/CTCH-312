extends Area2D

@onready var timer: Timer = $Timer


func _on_body_entered(body: Node2D) -> void:
	timer.start()
	print("You dead")


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
