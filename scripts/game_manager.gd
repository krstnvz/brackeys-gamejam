class_name GameManager
extends Node

@export var texture_success: Texture2D
@export var texture_died: Texture2D

@export var dishes: Array[Dish] = []

@onready var tutorial: CanvasLayer = $Overlays/Tutorial
@onready var fade: CanvasLayer = $Overlays/Fade

@onready var game_over: CanvasLayer = $Overlays/GameOver
@onready var status_texture: TextureRect = $Overlays/GameOver/StatusTexture
@onready var status_label: RichTextLabel = $Overlays/GameOver/StatusLabel
@onready var next_level_button: TextureButton = $Overlays/GameOver/HBoxContainer/NextLevelButton

func _ready() -> void:
	GameGlobals.registerSceneIngredients(get_scene_ingredients())
	
	if GameGlobals.has_tutorial_displayed == false:
		tutorial.visible = true
		GameGlobals.has_tutorial_displayed = true
	
	status_label.bbcode_enabled = true
	
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		$FullscreenButton.button_pressed = true

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_ESCAPE and tutorial.visible:
			_on_tutorial_button_button_up()

func _on_submit_button_button_up() -> void:
	var did_win = true
	
	for dish in dishes:
		if dish.is_dish_safe() != dish.get_safe_toggle_state():
			did_win = false
			break
			
	if did_win:
		status_texture.texture = texture_success
		status_label.append_text("[wave]Hooray[/wave], you managed to survive! The King is happy that he doesn't have to hire someone else.")
		status_label.newline()
		status_label.newline()
		status_label.append_text("Keep staying alive!")
	else:
		status_texture.texture = texture_died
		status_label.append_text("Oh, that's a shame! The King is alive, but you are pretty dead.")
		status_label.newline()
		status_label.newline()
		status_label.append_text("Try staying alive next time ;)")
	
	var is_last_level = Navigation.current_level == Navigation.Level.LEVEL_2
	next_level_button.visible = did_win == true && is_last_level == false
	
	game_over.visible = true
	
func get_scene_ingredients() -> Array[IngredientsData.Ingredient]:
	var unique_ingredients: Array[IngredientsData.Ingredient] = []
	for dish in dishes:
		for ingredient in dish.dish.ingredients:
			if !unique_ingredients.has(ingredient):
				unique_ingredients.append(ingredient)
				
	return unique_ingredients

func _on_menu_button_button_up() -> void:
	game_over.visible = false
	Navigation.go_to_menu()

func _on_fullscreen_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		
func _on_replay_button_button_up() -> void:
	game_over.visible = false
	Navigation.restart_level()

func _on_next_level_button_button_up() -> void:
	game_over.visible = false
	Navigation.start_level_2()

func _on_tutorial_button_button_up() -> void:
	tutorial.visible = !tutorial.visible
