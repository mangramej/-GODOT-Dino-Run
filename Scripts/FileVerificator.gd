extends Node2D

const SAVE_DIR = "user://saves/"
var savePath = SAVE_DIR + "save.dat"

var default_data = {
	"coins": 0,
	"current_skin": "vita",
	"skins": {
		"vita": "unlocked",
		"tard": "locked",
		"mort": "locked",
		"doux": "locked"
	}
}

func _ready():
	if not GameSaved.verify_save_file():
		create_save_file()
	quit()

func create_save_file():
	var dir = Directory.new()
	dir.make_dir_recursive(SAVE_DIR)
	var file = File.new()
	file.open_encrypted_with_pass(savePath, file.WRITE, "mangramej")
	file.store_var(default_data)
	file.close()

func quit():
	queue_free()
	var _eer = get_tree().change_scene("res://Scenes/Menu.tscn")
