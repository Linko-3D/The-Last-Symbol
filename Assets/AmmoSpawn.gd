extends Area


func _on_AmmoSpawn_body_entered(body):
	if body.name == "FirstPersonCharacter":
		get_tree().get_root().find_node("RayCast", true, false).ammo += 1
		queue_free()