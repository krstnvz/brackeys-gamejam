extends TextureRect

@onready var book_button: TextureButton = $BookButton
@onready var tip_off_button: TextureButton = $TipOffButton
@onready var dish_button: TextureButton = $DishButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tween = create_tween()
	var target_position = self.position.x - (self.size.x * self.scale.x)
	tween.tween_property(self, "position:x", target_position, 0.2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
