class_name DishData

extends Resource

@export var name: String = ""
@export var cook: CookData.Cooks = 0
@export var ingredients: Array[IngredientsData.Ingredient] = []
@export var poisoned: bool = false
@export var normal: AtlasTexture
@export var hightlight: AtlasTexture

func get_cook_name(cook: CookData.Cooks) -> String:
	match cook:
		CookData.Cooks.PETER:
			return "Peter"
		CookData.Cooks.ROSE:
			return "Rose"
		CookData.Cooks.SIMON:
			return "Simon"
		_:
			return "NO NAME"
	

func get_ingredient_name(ingredient: IngredientsData.Ingredient) -> String:
	match ingredient:
		IngredientsData.Ingredient.SUGAR:
			return "Sugar"
		IngredientsData.Ingredient.EGG:
			return "Egg"
		IngredientsData.Ingredient.MILK:
			return "Milk"
		IngredientsData.Ingredient.BUTTER:
			return "Butter"
		IngredientsData.Ingredient.SAFFRON:
			return "Saffron"
		IngredientsData.Ingredient.OATS:
			return "Oats"
		IngredientsData.Ingredient.SALMON:
			return "Salmon"
		IngredientsData.Ingredient.LEMON:
			return "Lemon"
		IngredientsData.Ingredient.DILL:
			return "Dill"
		IngredientsData.Ingredient.SALT:
			return "Salt"
		IngredientsData.Ingredient.CHICKEN:
			return "Chicken"
		IngredientsData.Ingredient.CARROT:
			return "Carrot"
		IngredientsData.Ingredient.PARSNIP:
			return "Parsnip"
		IngredientsData.Ingredient.ONION:
			return "Onion"
		IngredientsData.Ingredient.ROSEMARY:
			return "Rosemary"
		IngredientsData.Ingredient.PEAR:
			return "Pear"
		IngredientsData.Ingredient.CINNAMON:
			return "Cinnamon"
		IngredientsData.Ingredient.HONEY:
			return "Honey"
		IngredientsData.Ingredient.RASPBERRY:
			return "Raspberry"
		IngredientsData.Ingredient.STRAWBERRY:
			return "Strawberry"
		IngredientsData.Ingredient.CREAM_CHEESE:
			return "Cream Cheese"
		IngredientsData.Ingredient.GOAT_CHEESE:
			return "Goat Cheese"
		IngredientsData.Ingredient.OLIVE_OIL:
			return "Olive Oil"
		IngredientsData.Ingredient.SPINACH:
			return "Spinach"
		IngredientsData.Ingredient.WALNUT:
			return "Walnut"
		IngredientsData.Ingredient.VINEGAR:
			return "Vinegar"
		IngredientsData.Ingredient.GARLIC:
			return "Garlic"
		IngredientsData.Ingredient.CREAM:
			return "Cream"
		IngredientsData.Ingredient.YOGURT:
			return "Yogurt"
		IngredientsData.Ingredient.BLUEBERRY:
			return "Blueberry"
		_:
			return "NONE"
