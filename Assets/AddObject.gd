extends RayCast

export (PackedScene) var object

var target

func _ready():
	target = get_tree().get_nodes_in_group("Player")[0] # Get the first node in the group "Player" (recommended)

func _input(event):
	if event is InputEventMouseButton and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event.button_index == 1 and event.pressed == true:
			if is_colliding() and target.ammo > 0:
				var object_instance = object.instance() # We instance the scene
		
				add_child(object_instance) # The instance is added as a child of the shoot node
				object_instance.set_as_toplevel(true)
				object_instance.translation = get_collision_point()
				target.ammo -= 1
