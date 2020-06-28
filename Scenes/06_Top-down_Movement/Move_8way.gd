extends KinematicBody2D


var speed := 200
var velocity := Vector2.ZERO

func hello():
	print("hello")

func get_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed("right"):
		velocity.x += 1
	elif Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	elif Input.is_action_pressed("down"):
		velocity.y += 1
	
	velocity = velocity.normalized() * speed
# Called when the node enters the scene tree for the first time.
func _ready():
	var my_func_ref := funcref(self, "hello")
	my_func_ref.call_func()

func _process(delta):
	get_input()
	self.move_and_slide(velocity * speed * delta)

