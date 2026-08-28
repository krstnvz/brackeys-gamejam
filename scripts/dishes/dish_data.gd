class_name DishData

extends Resource

@export var name: String = ""
@export var cook: CookData.Cooks = 0
@export var ingredients: Array[IngredientsData.Ingredient] = []
@export var poisoned: bool = false
@export var normal: AtlasTexture
@export var hightlight: AtlasTexture
