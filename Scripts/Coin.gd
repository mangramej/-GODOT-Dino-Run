extends Area2D

signal coin_spawn
signal coin_up

onready var sound = $Sound

func _ready():
	emit_signal("coin_spawn")

func _on_Coin_body_entered(body):
	if body.is_in_group("Player"):
		emit_signal("coin_up")
		sound.play()
		hide()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
