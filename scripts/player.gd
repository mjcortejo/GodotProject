extends KinematicBody2D

var direction = Vector2(0,0)
var startPos = Vector2(0,0)
var moving = false

const SPEED = 1
const GRID = 16

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	
func _fixed_process(delta):
	if !moving:
		if Input.is_action_pressed("ui_up"):
			moving = true
			direction = Vector2(0, -1)
			startPos = get_pos()
		elif Input.is_action_pressed("ui_down"):
			moving = true
			direction = Vector2(0, 1)
			startPos = get_pos()
		elif Input.is_action_pressed("ui_left"):
			moving = true
			direction = Vector2(-1, 0)
			startPos = get_pos()
		elif Input.is_action_pressed("ui_right"):
			moving = true
			direction = Vector2(1, 0)
			startPos = get_pos()
	else:
		move_to(get_pos() + direction * SPEED)
		if get_pos() == startPos + Vector2(GRID * direction.x, GRID * direction.y):
			moving = false
