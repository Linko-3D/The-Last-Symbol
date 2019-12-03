extends Spatial

var player

func _ready():
	player = get_tree().get_nodes_in_group("Player")[0]

func _process(delta):
	if player.ammo > 0:
		#$Holding.visible = false
		pass