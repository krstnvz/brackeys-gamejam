extends VBoxContainer

@export var ingredient_button: PackedScene = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for ingredient in GameGlobals.ingredientsData.allIngredients:
		var button = ingredient_button.instantiate()
		button.add_ingredient(ingredient)
		add_child(button)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_dish_button_refresh_ingredients() -> void:
	for child in get_children():
		child.queue_free()
	
	for ingredient in GameGlobals.ingredientsData.allIngredients:
		var button = ingredient_button.instantiate()
		button.add_ingredient(ingredient)
		add_child(button)
	
	
	
