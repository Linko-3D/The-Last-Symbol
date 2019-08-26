extends RayCast

export (PackedScene) var impact
var ammo = 0

var explosion

func _process(delta):
	if ammo > 0:
		$AmmoHold.visible = true
	else:
		$AmmoHold.visible = false

func _input(event):
	if ammo >= 1:
		if event is InputEventMouseButton and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			if event.button_index == 1 and event.pressed == true:
				# Spawn cubes
				if get_collider() != null and get_collider().has_method("spawn"): # check if the object has health
					get_collider().spawn()
					ammo -= 1
					$SpellSound.play()