extends Position2D

onready var LongGrassFloor = preload("res://Scenes/Grounds/LongGrassFloor.tscn")
onready var ShortGrassFloor = preload("res://Scenes/Grounds/ShortGrassFloor.tscn")
onready var LongDirtFloor = preload("res://Scenes/Grounds/LongDirtFloor.tscn")
onready var ShortDirtFloor = preload("res://Scenes/Grounds/ShortDirtFloor.tscn")
onready var HighGrassFloor = preload("res://Scenes/Grounds/HighGrassFloor.tscn")

enum types {
	LONG_GRASS,
	LONG_DIRT,
	SHORT_GRASS,
	SHORT_DIRT,
	HIGH_GRASS,
}

func _ready():
	loop()

func loop():
	var floor_type = randi() % 5
	match floor_type:
		types.LONG_GRASS:
			instance_floor(LongGrassFloor, "long")
		
		types.LONG_DIRT:
			instance_floor(LongDirtFloor, "long")
		
		types.SHORT_GRASS:
			instance_floor(ShortGrassFloor, "short")
		
		types.SHORT_DIRT:
			instance_floor(ShortDirtFloor, "short")
		
		types.HIGH_GRASS:
			instance_floor(HighGrassFloor, "short")


func instance_floor(Floor, type):
	var instance = Floor.instance()
	instance.position = position
	get_tree().current_scene.call_deferred("add_child", instance)
	
	match type:
		"long":
			yield(get_tree().create_timer(2), "timeout")
		
		"short":
			yield(get_tree().create_timer(1), "timeout")
	
	loop()
