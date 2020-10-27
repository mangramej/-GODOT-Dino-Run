extends Node

const SAVE_DIR = "user://saves/"
var savePath = SAVE_DIR + "save.dat"

func verify_save_file():
	var dir = Directory.new()
	var file = File.new()
	if not dir.dir_exists(SAVE_DIR):
		if not file.file_exists(savePath):
			return false
	return true


func save_coins(amount):
	var saved_data = load_data()
	saved_data["coins"] += amount
	save_data(saved_data)

 
func save_skin(new_skin):
	var saved_data = load_data()
	saved_data["current_skin"] = new_skin
	save_data(saved_data)


func save_skin_unlocked(skin_name):
	var saved_data = load_data()
	saved_data["skins"][skin_name] = "unlocked"
	save_data(saved_data)


func save_data(data):
	if verify_save_file():
		var file = File.new()
		file.open_encrypted_with_pass(savePath, file.WRITE, "mangramej")
		file.store_var(data)
		file.close()


func load_data():
	var file = File.new()
	if verify_save_file():
		file.open_encrypted_with_pass(savePath, File.READ, "mangramej")
		var player_data = file.get_var()
		file.close()
		return player_data
