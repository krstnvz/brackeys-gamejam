extends Node

var poisons: Array[PoisonData]

@onready var title: Label = $Title
@onready var texture_rect: TextureRect = $AspectRatioContainer/TextureRect
@onready var poison_rich_text_label: RichTextLabel = $PoisonRichTextLabel
@onready var previous: Button = $HBoxContainer/previous
@onready var next: Button = $HBoxContainer/next

var current_poison_index: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func inject_poisons(poisons: Array[PoisonData]):
	self.poisons = poisons
	load_dish()

func load_dish():
	next.visible = current_poison_index < poisons.size() - 1
	previous.visible = current_poison_index > 0
	
	# Reset Label
	poison_rich_text_label.text = ""
	
	var poison = poisons[current_poison_index]
	title.text = poison.name
	texture_rect.texture = poison.sprite
	
	for line in poison.lines:
		poison_rich_text_label.append_text("[ul]" + line + "[/ul]")

func _on_next_button_up() -> void:
	current_poison_index += 1
	load_dish()

func _on_previous_button_up() -> void:
	current_poison_index -= 1
	load_dish()
