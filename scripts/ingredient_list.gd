extends VBoxContainer

@export var ingredient_button: PackedScene = null

var ingredientsData = IngredientsData.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ingredientsData.createAllIngredientsModel()
	
	for ingredient in ingredientsData.allIngredients:
		var button = ingredient_button.instantiate()
		button.add_ingredient(ingredient)
		button.item_toggled.connect(_on_ingredient_toggled)
		add_child(button)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_ingredient_toggled():
	pass
