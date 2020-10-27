extends Node2D

onready var CharacterDisplay = preload("res://Scenes/CharacterDisplay.tscn")
onready var pos = $Position2D

func _ready():
	GameSaved.verify_save_file()
	instance_player()

func instance_player():
	var instance = CharacterDisplay.instance()
	instance.position = pos.position
	add_child(instance)

func _on_Play_pressed():
	var _eer = get_tree().change_scene("res://Scenes/Main.tscn")


func _on_Quit_pressed():
	get_tree().quit()


func _on_Shop_pressed():
	var _eer = get_tree().change_scene("res://Scenes/Store.tscn")
