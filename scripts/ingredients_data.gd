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
	MAX_INGREDIENT
}

var allIngredients: Array[IngredientModel] = []

func createAllIngredientsModel():
	for ingredient in Ingredient.MAX_INGREDIENT:
		var model = IngredientModel.new()
		model.ingredient = ingredient
		allIngredients.append(model)

class IngredientModel:
	var ingredient: Ingredient
	var is_checked: bool = false
