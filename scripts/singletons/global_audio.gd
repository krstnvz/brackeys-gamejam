extends Node2D

var audio_pos: float = 0.0

func pause():
	audio_pos = $AudioStreamPlayer2D.get_playback_position()
	$AudioStreamPlayer2D.stop()
	
func play():
	$AudioStreamPlayer2D.play(audio_pos)
