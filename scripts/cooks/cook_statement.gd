extends PanelContainer

@export var cook_data: CookData = null
@onready var rich_text_label: RichTextLabel = $MarginContainer/RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rich_text_label.text = cook_data.statement

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
