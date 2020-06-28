extends MouseMove

export (PackedScene) var Bullet
onready var muzzle := $Muzzle


func _unhandled_input(event):
	if Input.is_action_just_pressed("shoot"):
		shoot()
	
func shoot():
	var b = Bullet.instance() as Bullet
	b.transform = muzzle.global_transform
	b.rotation = muzzle.global_rotation
	b.scale = Vector2.ONE
	get_tree().root.add_child(b)
	
