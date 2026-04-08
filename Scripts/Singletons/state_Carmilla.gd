extends Node

var scene
var curr_carmilla_instance

var rng = RandomNumberGenerator.new()

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

# A state for if the scene calls for a Carmilla spawner
var call_for_spawn : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# The primary state that Carmilla is in (at game start) will be Roaming
	# BUT that doesn't necessarilly mean she's in the currently loaded scene (at game start)
	carmilla_curr_roaming = true

# ________________________________________________________________DONE
func _process(delta: float) -> void:
	if !Global.current_scene == null:
		if Global.current_scene.has_node("Carmilla"):
			curr_carmilla_instance = Global.current_scene.get_node("Carmilla")
			print(curr_carmilla_instance)
			carmilla_en_scene = true
		else:
			#if she doesn't already exist, calculate a random value to
			# ddetermine if she should be spawned
			print("Carmilla does not currently exist in this scene")
			carmilla_en_scene = false
	
	# The current scene can call for a spawner
	if call_for_spawn:
		spawn_carmilla()
	defer_carmilla_spawner_disable()
	
	if carmilla_curr_stunned:
		get_stunned()
	
	
	
# ________________________________________________________________TODO !!!
# if carmilla is in the state of currently roaming, then she should be
# following a random position within a certain range, which changes every ten seconds
# Call something in her code
func roam_around():
	print("carmilla is currently roaming...")
	
	
	
# ________________________________________________________________DONE
# if carmilla is currently stunned,
# then she should be in this state for a time period
# once the time has elapsed, she should enteer her roaming state again
# her velocity should get changed to 0
func get_stunned():
	if carmilla_en_scene:
		print("carmilla is stunned!")
		change_state(carmilla_curr_stunned, carmilla_curr_roaming)
		carmilla_curr_stunned = false
		Global.current_scene.get_node("Carmilla").set_physics_process(false)
		await get_tree().create_timer(5).timeout
		Global.current_scene.get_node("Carmilla").set_physics_process(true)
	else:
		print("carmilla is stunned!")
		change_state(carmilla_curr_stunned, carmilla_curr_roaming)
		carmilla_curr_stunned = false
		curr_carmilla_instance.set_physics_process(false)
		await get_tree().create_timer(5).timeout
		curr_carmilla_instance.set_physics_process(true)
	

# ________________________________________________________________TODO !!!
# if Carmilla is in the state of currently chasing Lauren, then
# Switch the states (from roaming to chasing)
# Probably call a function within the Carmilla Player node
func hostile():
	pass


# ________________________________________________________________DONE
# Function to set the states, just so that it's easier for us
func change_state(curr_state : bool, next_state : bool):
	curr_state = false
	next_state = true



# Function to add a Carmilla node to the scene tree
# ________________________________________________________________TODO !!!
# add a check to see if Carmilla doesn't already exist
# probably a "has" check on the current scene tree
func spawn_carmilla():
	scene = load("res://Scenes/Entity Scenes/carmilla.tscn")
	curr_carmilla_instance = scene.instantiate()
	Global.current_scene.add_child(curr_carmilla_instance)
	print("The value of scene is: ", scene)
	print("The value of curr_carmilla_instance is: ", curr_carmilla_instance)
	
func defer_carmilla_spawner_disable():
	call_for_spawn = false
	
	
# ________________________________________________________________TODO !!!
# check if the random value equals 1 or 2. If it is, then return true
func should_random_spawn_calc():
	var my_random_number = rng.randi_range(1, 5)
	print(my_random_number)
	
	
