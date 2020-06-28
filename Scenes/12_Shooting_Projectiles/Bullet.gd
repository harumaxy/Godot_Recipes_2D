extends Area2D

class_name Bullet

var speed = 750

func _physics_process(delta):
	position += Vector2.RIGHT.rotated(self.rotation) * speed * delta


func _on_Bullet_body_entered(body: Node2D):
	if body.is_in_group("mobs"):
		body.queue_free()
	self.queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	self.queue_free()
