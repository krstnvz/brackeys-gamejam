extends TextureButton

func _ready() -> void:
	if GlobalAudio.is_paused():
		button_pressed = true	

func _on_toggled(toggled_on: bool) -> void:
	if toggled_on:
		GlobalAudio.pause()
	else:
		GlobalAudio.play()
