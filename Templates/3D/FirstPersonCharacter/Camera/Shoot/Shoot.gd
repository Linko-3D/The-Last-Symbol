extends Position3D

var force = 25
export (PackedScene) var bullet

var projectile

func _ready():
	projectile = bullet.instance() # Avoid to have a lag on the first shoot by preloading the projectile

func _input(event):
	
	if Input.is_action_just_pressed("flare"):
		projectile.health -= 1
		
		projectile = bullet.instance() # We instance the scene
		
		
		add_child(projectile) # The instance is added as a child of the shoot node
		projectile.set_as_toplevel(true) # Projectile parented to the highest node in the level to detach it from the player
		projectile.linear_velocity = global_transform.basis.z * -force # An initial force is applied when clicking, the force is applied on each new instance