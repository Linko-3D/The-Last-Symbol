extends Position3D

export (PackedScene) var bullet
var force = 30.0
var fire_rate = 5

var enabled = true

func _ready():
	$Timer.wait_time = fire_rate

func _process(delta):
	if enabled and $Timer.is_stopped():
		$Timer.start()
	if enabled == false:
		$Timer.stop()


func _on_Timer_timeout():
	$CanonSound.play()
	var projectile = bullet.instance() # We instance the scene
	
	add_child(projectile) # The instance is added as a child of the shoot node
	projectile.set_as_toplevel(true) # Projectile parented to the highest node in the level to detach it from the player
	projectile.linear_velocity = global_transform.basis.z * -force # An initial force is applied when clicking, the force is applied on each new instance
