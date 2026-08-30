extends Node

@onready var canvas_layer: CanvasLayer = $CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GameGlobals.fullscreen == true:
		$FullscreenButton.button_pressed = true
		
func _process(delta: float) -> void:
	if DisplayServer.window_get_mode() != DisplayServer.WINDOW_MODE_FULLSCREEN and GameGlobals.fullscreen == true:
		GameGlobals.fullscreen = false
		$FullscreenButton.button_pressed = false

func _on_button_button_up() -> void:
	Navigation.start_level_1()

func _on_check_button_toggled(toggled_on: bool) -> void:
	GameGlobals.set_game_fullscreen(toggled_on)

func _on_help_button_button_up() -> void:
	GameGlobals.has_tutorial_displayed = true
	canvas_layer.visible = true
