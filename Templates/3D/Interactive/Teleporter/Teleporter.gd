extends Area

export(Vector3) var destination
#target = get_tree().get_nodes_in_group("Player")[0] # Get the target with the first node in the Player group

func _process(delta):
	$Rotor.rotate_y(0.2)
	$Rotor2.rotate_y(-0.05)

func _on_TeleporterA_body_entered(body):
	if body.is_in_group("Player"):
		body.translation = destination
		$TeleporterSound.play()