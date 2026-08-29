class_name Dish
extends TextureButton

signal refresh_ingredients
signal show_dish_information(dish: DishData)

@export var dish: DishData = null

func _ready() -> void:
	texture_normal = dish.normal
	texture_hover = dish.hightlight

func _on_button_up() -> void:
	show_dish_information.emit(dish)
		
func is_dish_safe() -> bool:
	return !dish.poisoned
	
func get_safe_toggle_state() -> bool:
	return $CheckButton.button_pressed

func _on_check_button_toggled(toggled_on: bool) -> void:
	#GameGlobals.updateIngredients(dish, toggled_on)
	refresh_ingredients.emit()
	
