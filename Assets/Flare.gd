extends RigidBody

var lifespan = 10
var target
var target_coordinates = Vector3()
var current_coordinates = Vector3()
var offset = Vector3()

func _ready():
	$AnimationPlayer.play("Light")
	yield(get_tree().create_timer(lifespan), "timeout")
	$OmniLight.queue_free()

func _on_Area_body_entered(body):
	if body.is_in_group("Player") == false:
		target = body
		target_coordinates = body.translation
		offset = translation - target_coordinates
		axis_lock_linear_z = true
		axis_lock_linear_x = true
		axis_lock_linear_y = true