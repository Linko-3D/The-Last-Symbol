extends Area

var player

func _ready():
	player = get_tree().get_nodes_in_group("Player")[0] # Get the first node in the group "Player" (recommended)

func _on_AmmoSpawn_body_entered(body):
	if player.ammo == 0:
		player.ammo = 1
		queue_free()
