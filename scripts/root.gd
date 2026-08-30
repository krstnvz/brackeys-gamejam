extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Navigation.root = $Scene
	Navigation.fade = $Fade
	Navigation.go_to_menu()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
