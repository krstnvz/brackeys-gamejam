extends Button

@export var cook_data: CookData = null

func _ready() -> void:
	text = CookData.Cooks.keys()[cook_data.cook]

func _on_button_up() -> void:
	print("\n" + CookData.Cooks.keys()[cook_data.cook] + ": " + cook_data.statement)
