extends KinematicBody2D

var speed = 200
var target = null
var velocity = Vector2.ZERO


func _input(event: InputEvent):
	if event.is_action_pressed("click"):
		target = event.position

func _physics_process(delta):
	if target:
		look_at(target)
		velocity = Vector2.RIGHT.rotated(self.rotation)
		self.move_and_slide(velocity * speed)
		

