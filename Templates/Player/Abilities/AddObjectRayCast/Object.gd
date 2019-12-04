extends StaticBody

func _process(delta):
	if Input.is_action_just_pressed("restart"):
		queue_free()