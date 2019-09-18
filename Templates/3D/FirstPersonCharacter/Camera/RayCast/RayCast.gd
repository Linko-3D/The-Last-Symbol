extends RayCast

export (PackedScene) var impact
var ammo = 0

var explosion

func _process(delta):
	if ammo > 0:
		$AmmoHold.visible = true
	else:
		$AmmoHold.visible = false
		$AmmoHold/Ray.visible = false

func _input(event):
	if ammo >= 1:
		if get_collider() != null and get_collider().has_method("spawn"):
			$AmmoHold/Ray.visible = true
			if event is InputEventMouseButton and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
				
				if event.button_index == 1 and event.pressed == true:
	
					get_collider().spawn()
					ammo -= 1
					$SpellSound.play()
		else:
			$AmmoHold/Ray.visible = false