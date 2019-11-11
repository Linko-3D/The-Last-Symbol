extends Area

var target

func _ready():
	target = get_tree().get_nodes_in_group("Player")[0] # Get the first node in the group "Player" (recommended)

func _on_AmmoSpawn_body_entered(body):
	if body.name == "FirstPersonCharacter" and target.ammo == 0:
		target.ammo += 1
		queue_free()