extends Node

var menu_scene: PackedScene = preload("res://scenes/game/main_menu.tscn")
var level_1_scene: PackedScene = preload("res://scenes/game/level_1.tscn")
var level_2_scene: PackedScene = preload("res://scenes/game/level_2.tscn")

var current_scene: Node = null
# Injected in the root script
var root: Node

func start_level_1():
	free_current_scene()
	
	current_scene = level_1_scene.instantiate()
	root.add_child(current_scene)

func start_level_2():
	free_current_scene()
	
	current_scene = level_2_scene.instantiate()
	root.add_child(current_scene)

func go_to_menu():
	free_current_scene()
	
	current_scene = menu_scene.instantiate()
	root.add_child(current_scene)

func free_current_scene():
	if current_scene != null:
		current_scene.queue_free()
		current_scene = null
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
