class_name Dish
extends Button

@export var dish: DishData = null

func _ready() -> void:
	text = dish.name

func _on_button_up() -> void:
	print("\n" + dish.name)
	print("made by: " + CookData.Cooks.keys()[dish.cook])
	print("contains: ")
	for ingredient in dish.ingredients:
		print(IngredientsData.Ingredient.keys()[ingredient])
		
func is_dish_safe() -> bool:
	return !dish.poisoned
	
func get_safe_toggle_state() -> bool:
	return $CheckButton.button_pressed
