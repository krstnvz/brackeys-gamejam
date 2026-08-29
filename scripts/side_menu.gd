extends Node

signal refresh_ingredients_list

@export var tip_off_data: TipOffData

@onready var tip_off_container: Node = $TipOffContainer
@onready var tip_off_rich_text_label: RichTextLabel = $TipOffContainer/TipOffRichTextLabel
@onready var ingredients_container: ScrollContainer = $ScrollContainer
@onready var menu_page: TextureRect = $PageTexture

enum Tab {
	TIP_OFF, INGREDIENT, BOOK, DISH, NONE
}

var is_menu_open: bool = false
var selected_tab: Tab = Tab.NONE
var buttons: Array[TextureButton] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	buttons = [
		$PageTexture/TipOffButton,
		$PageTexture/IngredientButton,
		$PageTexture/BookButton,
		$PageTexture/DishButton,
	]
	
	for line in tip_off_data.lines:
		var formatted = "- " + line
		tip_off_rich_text_label.append_text(formatted)
		tip_off_rich_text_label.newline()
		tip_off_rich_text_label.newline()

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
	var target_position = self.position.x - (menu_page.size.x * menu_page.scale.x)
	run_animation(target_position, 0.25)

func close_menu():
	selected_tab = Tab.NONE
	is_menu_open = false
	var target_position = self.position.x + (menu_page.size.x * menu_page.scale.x)
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
	
	if is_menu_open == true:
		selected_tab = tab
		update_buttons_toggle_state(selected_tab)
	
func _on_tip_off_button_button_up() -> void:
	trigger_tab(Tab.TIP_OFF)
	tip_off_container.visible = true
	ingredients_container.visible = false

func _on_ingredient_button_button_up() -> void:
	trigger_tab(Tab.INGREDIENT)
	ingredients_container.visible = true
	tip_off_container.visible = false

func _on_book_button_button_up() -> void:
	trigger_tab(Tab.BOOK)
	ingredients_container.visible = false
	tip_off_container.visible = false

func _on_dish_button_button_up() -> void:
	trigger_tab(Tab.DISH)
	ingredients_container.visible = false
	tip_off_container.visible = false

func _on_request_dish_refresh_ingredients() -> void:
	refresh_ingredients_list.emit()
