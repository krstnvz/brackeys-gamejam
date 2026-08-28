extends Node

var menu_scene: PackedScene = preload("res://scenes/game/main_menu.tscn")
var game_scene: PackedScene = preload("res://scenes/game/level_1.tscn")

var current_scene: Node = null
var root: Node

func start_game():
	if current_scene != null:
		current_scene.queue_free()
	
	current_scene = game_scene.instantiate()
	root.add_child(current_scene)

func go_to_menu():
	if current_scene != null:
		current_scene.queue_free()
	
	current_scene = menu_scene.instantiate()
	root.add_child(current_scene)
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
