extends KinematicBody2D

signal player_died

onready var anim = $AnimatedSprite

export(int) var jump_height = -250
export(int) var max_gravity = 400

var motion = Vector2.ZERO
var can_jump = true

var anim_name : String

func _ready():
	var data = GameSaved.load_data()
	anim_name += data["current_skin"]

func _physics_process(delta):
	apply_gravity(delta)
	
	if is_on_floor():
		anim.play(anim_name + "_run")
		can_jump = true
	else:
		anim.play(anim_name + "_jump")
		can_jump = false

	motion = move_and_slide(motion, Vector2.UP)

func apply_gravity(delta):
	if not is_on_floor():
		motion.y += 516 * delta
	motion.y = min(motion.y, max_gravity);

func jump():
	if can_jump:
		motion.y += jump_height
	

func _on_Jump_pressed():
	jump()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	emit_signal("player_died")
