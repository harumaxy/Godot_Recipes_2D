extends KinematicBody2D

class_name MouseMove

var speed := 200
const v_axis := JOY_AXIS_1
var velocity = Vector2.ZERO

func get_input():
	velocity = Vector2.ZERO
	velocity.x = -Input.get_joy_axis(0, v_axis)

	
func _physics_process(delta):
	look_at(get_global_mouse_position())
	get_input()
	velocity = move_and_slide(velocity.rotated(self.rotation) * speed)
	
