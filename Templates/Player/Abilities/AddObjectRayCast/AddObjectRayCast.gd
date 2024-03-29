extends RayCast

export (PackedScene) var object

var snap = Vector3()

var player
var object_rotation = Vector3()

func _ready():
	player = get_tree().get_nodes_in_group("Player")[0]
	visible = true

func _process(delta):
	
	$Holding/AIM.look_at(get_collision_point(), Vector3.UP)

func _input(event):
	if event is InputEventMouseButton and player.ammo >= 1:
		if event.button_index == 1 and event.pressed == true:
			if is_colliding() and object != null:
				var object_instance = object.instance()
	
				snap = get_collision_point()
				snap.x = stepify(get_collision_point().x, 2)
				snap.z = stepify(get_collision_point().z, 2)
				
				get_tree().get_root().add_child(object_instance)
				object_instance.translation = snap
				object_rotation.y = stepify(player.rotation_degrees.y, 90)
				object_instance.rotation_degrees = object_rotation
				player.ammo -= 1
