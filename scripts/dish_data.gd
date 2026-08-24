class_name DishData
extends Resource

enum Ingredients { SUGAR, EGG, MILK, BUTTER, SAFFRON, OATS, SALMON, LEMON, DILL, SALT, 
	CHICKEN, CARROT, PARSNIP, ONION, ROSEMARY, PEAR, CINNAMON, HONEY, RASPBERRY, STRAWBERRY, CREAM_CHEESE }

@export var name: String = ""
@export var cook: CookData.Cooks = 0
@export var ingredients: Array[Ingredients] = []
@export var poisoned: bool = false
