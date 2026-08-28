extends Label

signal item_toggled

var model: IngredientsData.IngredientModel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_ingredient(item):
	model = item
	self.text = item.get_name()
	$TextureButton.button_pressed = model.is_checked
	
func _on_toggled(toggled_on: bool) -> void:
	model.is_checked = toggled_on
	item_toggled.emit()
