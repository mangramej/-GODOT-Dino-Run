extends Node2D

onready var label = $CanvasLayer/MarginContainer/HBoxContainer/VBoxContainer/Label

var coin_count = 0 setget add_count

func _ready():
	var main = get_parent()
	main.connect("auto_save", self, "_on_auto_save")

func _process(_delta):
	var coins = get_tree().get_nodes_in_group("Coins")
	for coin in coins:
		if coin.is_connected("coin_up", self, "_on_coin_picked") == false:
			coin.connect("coin_up", self, "_on_coin_picked")

func add_count(value):
	coin_count = value

func _on_coin_picked():
	coin_count += 1
	label.text = str(coin_count)

func _on_auto_save():
	GameSaved.save_coins(coin_count)
