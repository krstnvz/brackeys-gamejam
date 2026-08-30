extends Node

enum Level { LEVEL_1, LEVEL_2 }

var menu_scene: PackedScene = preload("res://scenes/game/main_menu.tscn")
var level_1_scene: PackedScene = preload("res://scenes/game/level_1.tscn")
var level_2_scene: PackedScene = preload("res://scenes/game/level_2.tscn")

var current_level: Level
var current_scene: Node = null

# Injected in the root script
var root: Node
var fade: CanvasLayer
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func restart_level():
	if current_level == Level.LEVEL_1:
		start_level_1()
	elif current_level == Level.LEVEL_2:
		start_level_2()

func start_level_1():
	await fade.fade_out().finished
	current_level = Level.LEVEL_1
	free_current_scene()
	
	current_scene = level_1_scene.instantiate()
	root.add_child(current_scene)
	fade.fade_in()

func start_level_2():
	await fade.fade_out().finished
	current_level = Level.LEVEL_2
	free_current_scene()
	
	current_scene = level_2_scene.instantiate()
	root.add_child(current_scene)
	fade.fade_in()

func go_to_menu():
	await fade.fade_out().finished
	free_current_scene()
	
	current_scene = menu_scene.instantiate()
	root.add_child(current_scene)
	fade.fade_in()

func free_current_scene():
	if current_scene != null:
		current_scene.queue_free()
		current_scene = null
