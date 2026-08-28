extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ColorRect.color.a = 0.0
	self.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func fade(targer_alpha: float, duration: float = 0.6):
	self.visible = true
	var tween = create_tween()
	tween.tween_property($ColorRect, "color:a", targer_alpha, duration)
	return tween
