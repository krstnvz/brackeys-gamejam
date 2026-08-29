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

class IngredientModel:
	var ingredient: Ingredient
	var is_checked: bool = false
	
	func get_name() -> String:
		match ingredient:
			Ingredient.SUGAR:
				return "Sugar"
			Ingredient.EGG:
				return "Egg"
			Ingredient.MILK:
				return "Milk"
			Ingredient.BUTTER:
				return "Butter"
			Ingredient.SAFFRON:
				return "Saffron"
			Ingredient.OATS:
				return "Oats"
			Ingredient.SALMON:
				return "Salmon"
			Ingredient.LEMON:
				return "Lemon"
			Ingredient.DILL:
				return "Dill"
			Ingredient.SALT:
				return "Salt"
			Ingredient.CHICKEN:
				return "Chicken"
			Ingredient.CARROT:
				return "Carrot"
			Ingredient.PARSNIP:
				return "Parsnip"
			Ingredient.ONION:
				return "Onion"
			Ingredient.ROSEMARY:
				return "Rosemary"
			Ingredient.PEAR:
				return "Pear"
			Ingredient.CINNAMON:
				return "Cinnamon"
			Ingredient.HONEY:
				return "Honey"
			Ingredient.RASPBERRY:
				return "Raspberry"
			Ingredient.STRAWBERRY:
				return "Strawberry"
			Ingredient.CREAM_CHEESE:
				return "Cream Cheese"
			Ingredient.GOAT_CHEESE:
				return "Goat Cheese"
			Ingredient.OLIVE_OIL:
				return "Olive Oil"
			Ingredient.SPINACH:
				return "Spinach"
			Ingredient.WALNUT:
				return "Walnut"
			Ingredient.VINEGAR:
				return "Vinegar"
			Ingredient.GARLIC:
				return "Garlic"
			Ingredient.CREAM:
				return "Cream"
			Ingredient.YOGURT:
				return "Yogurt"
			Ingredient.BLUEBERRY:
				return "Blueberry"
			_:
				return "NONE"

var sceneIngredients: Array[IngredientModel] = []

func get_sorted_ingredients() -> Array[IngredientModel]:
	sceneIngredients.sort_custom(func(a,b): return a.get_name() < b.get_name())
	return sceneIngredients

func createSceneIngredientModel(ingredents: Array[Ingredient]):
	for ingredient in ingredents:
		var model = IngredientModel.new()
		model.ingredient = ingredient
		sceneIngredients.append(model)	

func crossAllIngredientsOut():
	for ingredient in sceneIngredients:
		ingredient.is_checked = false
		
func is_specific_ingredient(model, expected):
	return model.ingredient == expected

func crossIngredient(ingredient):
	var index = sceneIngredients.find_custom(
		is_specific_ingredient.bind(ingredient)
	)
	
	if index >= 0:
		sceneIngredients[index].is_checked = true
