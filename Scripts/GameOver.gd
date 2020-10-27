extends Node2D

func _on_Play_pressed():
	var _eer = get_tree().change_scene("res://Scenes/Main.tscn")


func _on_Quit_pressed():
	get_tree().quit()


func _on_Shop_pressed():
	var _eer = get_tree().change_scene("res://Scenes/Store.tscn")
