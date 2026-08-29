extends Node2D

var dishes: Array[DishData]

@onready var title: Label = $Title
@onready var dish_rich_text_label: RichTextLabel = $DishRichTextLabel
@onready var next: Button = $next
@onready var previous: Button = $previous

var current_dish_index: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func inject_dishes(dishes: Array[DishData]):
	self.dishes = dishes
	load_dish()

func is_dish(dish, expected):
	return dish.name == expected.name

func show_dish(dish: DishData):
	current_dish_index = dishes.find_custom(is_dish.bind(dish))
	load_dish()

func load_dish():
	next.visible = current_dish_index < dishes.size() - 1
	previous.visible = current_dish_index > 0
	
	# Reset Label
	dish_rich_text_label.text = ""
	
	var dish = dishes[current_dish_index]
	title.text = dish.name
	
	var made_by = "Made by: " + dish.get_cook_name(dish.cook)
	dish_rich_text_label.append_text(made_by)
	dish_rich_text_label.newline()
	dish_rich_text_label.newline()
	dish_rich_text_label.append_text("Contains: ")
	dish_rich_text_label.newline()
	dish_rich_text_label.newline()
	
	for ingredient in dish.ingredients:
		var name = dish.get_ingredient_name(ingredient)
		dish_rich_text_label.append_text("[ul]" + name + "[/ul]")

func _on_next_button_up() -> void:
	current_dish_index += 1
	load_dish()

func _on_previous_button_up() -> void:
	current_dish_index -= 1
	load_dish()
