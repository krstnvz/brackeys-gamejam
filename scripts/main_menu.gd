extends Node

@onready var canvas_layer: CanvasLayer = $CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().get_root().size_changed.connect(_on_window_size_changed)
	
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		$FullscreenButton.button_pressed = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_window_size_changed() -> void:
	if DisplayServer.window_get_mode() != DisplayServer.WINDOW_MODE_FULLSCREEN:
		$FullscreenButton.button_pressed = false
	
func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN and event.is_released() and event.keycode == KEY_ESCAPE:
			$FullscreenButton.button_pressed = false

func _on_button_button_up() -> void:
	Navigation.start_level_1()

func _on_check_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_help_button_button_up() -> void:
	GameGlobals.has_tutorial_displayed = true
	canvas_layer.visible = true
