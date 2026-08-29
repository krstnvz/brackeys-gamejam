extends Node

@export var cooks: Array[CanvasLayer]

var current_visible: CanvasLayer = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_visibility_button_up() -> void:
	pass

func _on_statement_overlay_visibility_changed() -> void:
	var is_all_hidden = true
	for cook in cooks:
		if cook.visible:
			is_all_hidden = false
			break
	
	if is_all_hidden:
		current_visible = null
	
	if current_visible == null:
		for cook in cooks:
			if cook.visible:
				current_visible = cook
				break
	else:
		current_visible.visible = false
		for cook in cooks:
			if cook.visible:
				current_visible = cook
