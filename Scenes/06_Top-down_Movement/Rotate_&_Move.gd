extends KinematicBody2D


var speed := 200
var rotation_speed := 1.5
var velocity = Vector2.ZERO
var rotation_dir = 0

# enum
const h_axis = JOY_AXIS_0
const v_axis = JOY_AXIS_1

func get_input():
	rotation_dir = 0
	velocity = Vector2.ZERO
	# Joy Stick の場合、Axisで入力するとさらに記述量が少なくなる
	rotation_degrees += Input.get_joy_axis(0, h_axis)
	velocity.y = Input.get_joy_axis(0, v_axis)


# vector2_instance.rotated(deg)で、回転したvectorを得られる
func _physics_process(delta):
	get_input()
	rotation += rotation_dir * rotation_speed * delta
	velocity = move_and_slide(velocity.rotated(rotation) * speed)
	

