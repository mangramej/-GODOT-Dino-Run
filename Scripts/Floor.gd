extends Node2D

const VELOCITY = -320

func _process(delta):
	position.x += VELOCITY * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
