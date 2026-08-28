extends TextureRect

enum Tab {
	BOOK, TIP_OFF, DISH, INGREDIENT, NONE
}

var is_menu_open: bool = false
var selected_tab: Tab = Tab.NONE
var buttons: Array[TextureButton] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	buttons = [
		$BookButton,
		$TipOffButton,
		$DishButton,
		$IngredientButton
	]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func toggle_menu():
	if is_menu_open:
		close_menu()
	else:
		open_menu()

func open_menu():
	is_menu_open = true
	var target_position = self.position.x - (self.size.x * self.scale.x)
	run_animation(target_position, 0.25)

func close_menu():
	is_menu_open = false
	var target_position = self.position.x + (self.size.x * self.scale.x)
	run_animation(target_position, 0.2)
	pass

func run_animation(target_position: float, duration: float):
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_SINE)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "position:x", target_position, duration)

func update_buttons_toggle_state(selected_tab: Tab):
	for tab in Tab.NONE:
		if tab != selected_tab:
			buttons[tab].button_pressed = false

func trigger_tab(tab: Tab):
	if selected_tab == Tab.NONE || selected_tab == tab:
		toggle_menu()
		
	selected_tab = tab
	update_buttons_toggle_state(selected_tab)

func _on_book_button_button_up() -> void:
	trigger_tab(Tab.BOOK)

func _on_tip_off_button_button_up() -> void:
	trigger_tab(Tab.TIP_OFF)

func _on_dish_button_button_up() -> void:
	trigger_tab(Tab.DISH)

func _on_ingredient_button_button_up() -> void:
	trigger_tab(Tab.INGREDIENT)

# Not Used

func _on_book_button_toggled(toggled_on: bool) -> void:
	pass
	
func _on_tip_off_button_toggled(toggled_on: bool) -> void:
	pass

func _on_dish_button_toggled(toggled_on: bool) -> void:
	pass

func _on_ingredient_button_toggled(toggled_on: bool) -> void:
	pass
