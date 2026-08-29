extends Node

signal on_scene_ingredients_ready

var scene_ingredients: Array[IngredientsData.Ingredient] = []
var ingredients_data = IngredientsData.new()
var safe_dishes: Array[DishData] = []

func updateIngredients(dish_data, value):
	ingredients_data.crossAllIngredientsOut()
	
	var index = safe_dishes.find(dish_data)
	
	# dish not in the array
	if index < 0 && value:
		safe_dishes.append(dish_data)
	else:
		if index >= 0:
			safe_dishes.remove_at(index)
	
	for dish in safe_dishes:
		for ingredient in dish.ingredients:
			ingredients_data.crossIngredient(ingredient)

func registerSceneIngredients(ingredients):
	scene_ingredients = ingredients
	ingredients_data.createSceneIngredientModel(scene_ingredients)
	on_scene_ingredients_ready.emit()
