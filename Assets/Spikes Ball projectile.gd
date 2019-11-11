extends RigidBody

var lifespan = 15

func _ready():
	yield(get_tree().create_timer(lifespan), "timeout")
	queue_free()

func _on_Area_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().reload_current_scene()
