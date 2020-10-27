extends Control

onready var anim		= $AnimationPlayer
onready var label		= $Padding/HBoxContainer/Label
onready var vita_button = $Padding2/HBoxContainer/Vita/VitaButton
onready var tard_button = $Padding2/HBoxContainer/Tard/TardButton
onready var mort_button = $Padding2/HBoxContainer/Mort/MortButton
onready var doux_button = $Padding2/HBoxContainer/Doux/DouxButton


func _ready():
	update_coins_display()
	update_button()

func update_button():
	var saved_data = GameSaved.load_data()
	var current_skin = saved_data["current_skin"]
	
	# For Vita Button
	if current_skin == "vita" and saved_data["skins"]["vita"] == "unlocked":
		equip(vita_button)
	elif saved_data["skins"]["vita"] == "unlocked":
		unlock(vita_button)
	else:
		lock(vita_button)
	
	# For Tard Button
	if current_skin == "tard" and saved_data["skins"]["tard"] == "unlocked":
		equip(tard_button)
	elif saved_data["skins"]["tard"] == "unlocked":
		unlock(tard_button)
	else:
		lock(tard_button)
	
	# For Mort Button
	if current_skin == "mort" and saved_data["skins"]["mort"] == "unlocked":
		equip(mort_button)
	elif saved_data["skins"]["mort"] == "unlocked":
		unlock(mort_button)
	else:
		lock(mort_button)
	
	# For Doux Button
	if current_skin == "doux" and saved_data["skins"]["doux"] == "unlocked":
		equip(doux_button)
	elif saved_data["skins"]["doux"] == "unlocked":
		unlock(doux_button)
	else:
		lock(doux_button)


func lock(button):
	button.text = "BUY 500"

func unlock(button):
	button.text = "USE"

func equip(button):
	button.text = "EQUIPPED"


func update_coins_display():
	var saved_data = GameSaved.load_data()
	label.text = str(saved_data["coins"])

func _on_Back_pressed():
	var _eer = get_tree().change_scene("res://Scenes/Menu.tscn")

func purchase(price, skin_name):
	var saved_data = GameSaved.load_data()
	if saved_data["coins"] >= price and saved_data["skins"][skin_name] == "locked":
		GameSaved.save_coins(-price)
		GameSaved.save_skin_unlocked(skin_name)
	else:
		if saved_data["skins"][skin_name] != "unlocked":
			anim.play("not_enough_coins_anim")


func equip_skin(skin_name):
	var saved_data = GameSaved.load_data()
	if saved_data["skins"][skin_name] == "unlocked":
		GameSaved.save_skin(skin_name)

func _on_VitaButton_pressed():
	equip_skin("vita")
	update_button()


func _on_TardButton_pressed():
	purchase(500, "tard")
	equip_skin("tard")
	update_button()
	update_coins_display()


func _on_MortButton_pressed():
	purchase(500, "mort")
	equip_skin("mort")
	update_button()
	update_coins_display()


func _on_DouxButton_pressed():
	purchase(500, "doux")
	equip_skin("doux")
	update_button()
	update_coins_display()
