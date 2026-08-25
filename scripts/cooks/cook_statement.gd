extends RichTextLabel

@export var cook_data: CookData = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = cook_data.statement

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
