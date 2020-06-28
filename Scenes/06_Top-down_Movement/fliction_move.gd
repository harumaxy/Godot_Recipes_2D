extends KinematicBody2D


export var speed := 200
export (float, 0, 1) var friction = 0.01
export (float, 0, 1) var acceleration = 0.1

const h_axis = JOY_AXIS_0
const v_axis = JOY_AXIS_1
const p1_device = 0

var velocity := Vector2.ZERO

func get_input() -> Vector2:
	var input = Vector2.ZERO
	input.x = Input.get_joy_axis(p1_device, h_axis)
	input.y = Input.get_joy_axis(p1_device, v_axis)
	
	input.x = input.x if abs(input.x) > 0.2 else 0
	input.y = input.y if abs(input.y) > 0.2 else 0
	
	return input

func _physics_process(delta):
	var direction = get_input().normalized()
	if direction.length() > 0:
		velocity = lerp(velocity, direction * speed, acceleration)
	else:
		velocity = lerp(velocity, Vector2.ZERO, friction)
		
	move_and_slide(velocity)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
