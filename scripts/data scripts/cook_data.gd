class_name CookData
extends Resource

enum Cooks { ROSE, SIMON, PETER }

@export var cook: Cooks = 0
@export var statement: String = ""
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
