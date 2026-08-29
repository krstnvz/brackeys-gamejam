extends TextureButton

func _on_toggled(toggled_on: bool) -> void:
	if toggled_on:
		GlobalAudio.pause()
	else:
		GlobalAudio.play()
