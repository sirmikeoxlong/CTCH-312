extends Node

# A state for when Carmilla is Normal/roaming
var carmilla_curr_roaming : bool

# A state for when Carmilla is Chasing Lauren
var carmilla_curr_chasing : bool

# A state for when Carmilla is in the middle of dialogue
var carmilla_curr_dialogue : bool

# A state for when Carmilla is currently stunned
var carmilla_curr_stunned : bool

# A state for when Carmilla is currently in the room
var carmilla_en_scene : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# The primary state that Carmilla is in (at game start) will be Roaming
	# BUT that doesn't necessarilly mean she's in the currently loaded scene (at game start)
	carmilla_curr_roaming = true
	carmilla_en_scene = false
	spawn_carmilla()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if carmilla_en_scene:
		spawn_carmilla()
	
	if carmilla_curr_roaming:
		roam_around()
	elif carmilla_curr_stunned:
		get_stunned()
	elif carmilla_curr_chasing:
		hostile()
	else:
		pass
	
# if carmilla is in the state of currently roaming, then she should be
# following a random position within a certain range, which changes every ten seconds
# Call something in her code
func roam_around():
	pass
	
# if carmilla is currently stunned,
# then she should be in this state for a time period
# once the time has elapsed, she should enteer her roaming state again
func get_stunned():
	pass

# if Carmilla is in the state of currently chasing Lauren, then
# Switch the states (from roaming to chasing)
# Probably call a function within the Carmilla Player node
func hostile():
	pass

# Function to set the states, just so that it's easier for us
func change_state(curr_state : bool, next_state : bool):
	curr_state = false
	next_state = true
	
# Function to add a Carmilla node to the scene tree
func spawn_carmilla():
	print("spawner entered")
	var scene = load("res://Scenes/Entity Scenes/carmilla.tscn")
	var instance = scene.instantiate()
	Global.current_scene.add_child(scene)
	
func defer_carmilla_spawner_disable():
	carmilla_en_scene = false
	
