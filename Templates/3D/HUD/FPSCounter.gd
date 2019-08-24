extends Label

func _process(delta):
	 # Find the node with the name "Player"

	text = "Ammunition(s): " + str(get_tree().get_root().find_node("RayCast", true, false).ammo)