extends Area

var speed = 0.05

func _process(delta):
	randomize()

	rotate_x(rand_range(-speed, speed))
	rotate_y(rand_range(-speed, speed))
	rotate_z(rand_range(-speed, speed))

func _on_AmmoSpawn_body_entered(body):
	if body.name == "FirstPersonCharacter":
		body.ammo()
		get_tree().get_root().find_node("RayCast", true, false).ammo += 1
		queue_free()