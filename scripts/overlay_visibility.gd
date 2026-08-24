extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	
func _on_cancel_button_button_up() -> void:
	visible = false

func _on_tip_off_button_button_up() -> void:
	visible = false if visible else true
