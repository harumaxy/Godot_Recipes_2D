extends Sprite


func _process(delta):
	self.position = get_global_mouse_position()
