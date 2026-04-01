extends Node

var current_scene = null
var items = []
var collectedItems = []
var dialogue = []
var completed_room_dialogue = []
var puzzles = []
var completed_puzzles = []

# ___________________GRAND HALL KEYS_______________________

# library
var lib_key1_collect = false
var lib_key2_colelct = false
var lib_key3_colelct = false

# misc

var boot_key_collect = false

# ___________________SMALL ROOM KEYS_______________________

var spare_bed_key = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var root = get_tree().root
	# load the current scene
	current_scene = root.get_child(-1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func goto_scene(path):
	_deferred_goto_scene.call_deferred(path)

func _deferred_goto_scene(path):
	current_scene.free() #remove the current scene
	
	var temp = ResourceLoader.load(path) #load the new scene
	
	current_scene = temp.instantiate() #apparently this instances the new scene

	get_tree().root.add_child(current_scene) #add it to the active scene, as child of root
	
	# Optionally, to make it compatible with the SceneTree.change_scene_to_file() API.
	get_tree().current_scene = current_scene
