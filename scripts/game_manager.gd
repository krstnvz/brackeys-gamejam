extends Node

@export var dishes: Array[Dish] = []

func _on_submit_button_button_up() -> void:
	for dish in dishes:
		if dish.is_dish_safe() != dish.get_safe_toggle_state():
			print("WRONG SOLUTION, YOU DIE! >:(")
			return
	
	print("CORRECT SOLUTION, YOU LIVE! :)")

func _on_button_button_up() -> void:
	Navigation.go_to_menu()
