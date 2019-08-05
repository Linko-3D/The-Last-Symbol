extends RigidBody

var health = 3

func _process(delta):
	print(health)
	if health <= 0:
		queue_free()