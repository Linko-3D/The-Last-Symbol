extends Area

var speed = 0.05
var target

func _process(delta):
	randomize()

	rotate_x(rand_range(-speed, speed))
	rotate_y(rand_range(-speed, speed))
	rotate_z(rand_range(-speed, speed))