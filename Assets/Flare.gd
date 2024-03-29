extends RigidBody

export var lifespan = 10.0

var target
var target_coordinates = Vector3()
var current_coordinates = Vector3()
var offset = Vector3()

func _ready():
	yield(get_tree().create_timer(lifespan), "timeout")
	queue_free()

func _on_Flare_body_entered(body):
	if body.is_in_group("Player") == false:
		axis_lock_linear_z = true
		axis_lock_linear_x = true
		axis_lock_linear_y = true
		axis_lock_angular_x = true
		axis_lock_angular_y = true
		axis_lock_angular_z = true
		sleeping = true