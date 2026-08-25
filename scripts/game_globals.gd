extends Node

var ingredientsData = IngredientsData.new()
var safeDishes: Array[DishData] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ingredientsData.createAllIngredientsModel()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func updateIngredients(dishData, value):
	ingredientsData.crossAllIngredientsOut()
	
	var index = safeDishes.find(dishData)
	
	# dish not in the array
	if index < 0 && value:
		safeDishes.append(dishData)
	else:
		if index >= 0:
			safeDishes.remove_at(index)
	
	for dish in safeDishes:
		for ingredient in dish.ingredients:
			ingredientsData.crossIngredient(ingredient)
