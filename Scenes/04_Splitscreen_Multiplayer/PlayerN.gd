extends KinematicBody2D


export (int) var speed = 400
export (int) var id = 0

var direction := Vector2.ZERO

onready var screen_size := get_viewport_rect().size

func get_input():
	if Input.is_action_pressed("right_%s" % id):
		direction.x = 1
	elif Input.is_action_pressed("left_%s" % id):
		direction.x = -1
	else:
		direction.x = 0
	
	if Input.is_action_pressed("down_%s" % id):
		direction.y = 1
	elif Input.is_action_pressed("up_%s" % id):
		direction.y = -1
	else:
		direction.y = 0



func _physics_process(_delta: float):
	get_input()
	var _velocity = move_and_slide(direction * speed, Vector2.UP)


