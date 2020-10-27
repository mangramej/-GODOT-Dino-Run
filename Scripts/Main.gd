extends Node2D

signal auto_save

onready var GameOver = preload("res://Scenes/GameOver.tscn")
onready var pos = $Position2D

func _ready():
	instance_player("res://Scenes/Player.tscn")
	var player = get_node("Player")
	player.connect("player_died", self, "_on_player_died")

func instance_player(player_path):
	var Player = load(player_path)
	var instance = Player.instance()
	instance.position = pos.position
	add_child(instance)

func _on_player_died():
	emit_signal("auto_save")
	var instance = GameOver.instance()
	add_child(instance)
