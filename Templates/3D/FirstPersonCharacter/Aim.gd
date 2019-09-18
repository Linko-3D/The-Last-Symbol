extends RayCast

func _process(delta):
	$Spatial.look_at(get_collision_point(), Vector3.UP)
	pass