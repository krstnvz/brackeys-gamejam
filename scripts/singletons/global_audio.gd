extends Node2D

var audio_pos: float = 0.0
var paused: bool = false

func pause():
	audio_pos = $AudioStreamPlayer2D.get_playback_position()
	$AudioStreamPlayer2D.stop()
	paused = true
	
func play():
	$AudioStreamPlayer2D.play(audio_pos)
	paused = false
	
func is_paused() -> bool:
	return paused
