class_name GameManager
extends Node

@export var dishes: Array[Dish] = []

func _ready() -> void:
	GameGlobals.registerSceneIngredients(get_scene_ingredients())

func _on_submit_button_button_up() -> void:
	for dish in dishes:
		if dish.is_dish_safe() != dish.get_safe_toggle_state():
			print("WRONG SOLUTION, YOU DIE! >:(")
			return
	
	print("CORRECT SOLUTION, YOU LIVE! :)")

func _on_button_button_up() -> void:
	Navigation.go_to_menu()

func _on_fullscreen_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		
func get_scene_ingredients() -> Array[IngredientsData.Ingredient]:
	var unique_ingredients: Array[IngredientsData.Ingredient] = []
	for dish in dishes:
		for ingredient in dish.dish.ingredients:
			if !unique_ingredients.has(ingredient):
				unique_ingredients.append(ingredient)
				
	return unique_ingredients
