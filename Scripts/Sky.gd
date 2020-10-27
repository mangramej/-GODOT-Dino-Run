extends Sprite

const VELOCITY = -100
var get_texture_width

func _ready():
	get_texture_width = int(texture.get_size().x * scale.x)

func _process(delta):
	position.x += VELOCITY * delta
	repeat_Position()

func repeat_Position():
	if position.x < -get_texture_width:
		position.x += 2 * get_texture_width
