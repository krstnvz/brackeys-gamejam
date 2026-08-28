class_name IngredientsData

enum Ingredient {
	SUGAR,
	EGG,
	MILK,
	BUTTER,
	SAFFRON,
	OATS,
	SALMON,
	LEMON,
	DILL,
	SALT,
	CHICKEN,
	CARROT,
	PARSNIP,
	ONION,
	ROSEMARY,
	PEAR,
	CINNAMON,
	HONEY,
	RASPBERRY,
	STRAWBERRY,
	CREAM_CHEESE,
	GOAT_CHEESE,
	OLIVE_OIL,
	SPINACH,
	WALNUT,
	VINEGAR,
	GARLIC,
	CREAM,
	YOGURT,
	BLUEBERRY,
	MAX_INGREDIENT
}

var allIngredients: Array[IngredientModel] = []

func createAllIngredientsModel():
	for ingredient in Ingredient.MAX_INGREDIENT:
		var model = IngredientModel.new()
		model.ingredient = ingredient
		allIngredients.append(model)

func crossAllIngredientsOut():
	for ingredient in allIngredients:
		ingredient.is_checked = false
		
func is_specific_ingredient(model, expected):
	return model.ingredient == expected

func crossIngredient(ingredient):
	var index = allIngredients.find_custom(
		is_specific_ingredient.bind(ingredient)
	)
	
	if index >= 0:
		allIngredients[index].is_checked = true

class IngredientModel:
	var ingredient: Ingredient
	var is_checked: bool = false
