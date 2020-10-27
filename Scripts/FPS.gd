extends MarginContainer

onready var fps_label = $HBoxContainer/VBoxContainer/FPS
onready var memory_label = $HBoxContainer/VBoxContainer/Memory

func _process(_delta):
	fps_label.text = "FPS " + str(Performance.get_monitor(Performance.TIME_FPS))
	memory_label.text = "Memory " + str(round(Performance.get_monitor(Performance.MEMORY_STATIC) / 1024 / 1024)) + " MB"
