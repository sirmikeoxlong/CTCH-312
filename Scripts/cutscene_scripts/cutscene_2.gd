extends Node2D

@onready var lauren: CharacterBody2D = $EnvironmetalSorting/Lauren

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.carmilla_movement_allowed = false
	lauren.disable_camera()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_sucks_has_yapped_about_it() -> void:
	$SuckBlood.play("suck")
	$Spotlight.hide()
	


func _on_scene_21_has_yapped_about_it() -> void:
	$LightMove.play("Spotlight_move")


func _on_bitten_has_yapped_about_it() -> void:
	Global.carmilla_movement_allowed = true
