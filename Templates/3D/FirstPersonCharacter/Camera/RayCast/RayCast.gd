extends RayCast

export (PackedScene) var impact

var explosion

func _input(event):
	if event is InputEventMouseButton and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event.button_index == 1 and event.pressed == true:

			
			# Spawn cubes
			if get_collider() != null and get_collider().has_method("spawn"): # check if the object has health
				get_collider().spawn()