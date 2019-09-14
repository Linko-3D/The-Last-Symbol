extends Area

var target

func _ready():
	target = get_tree().get_nodes_in_group("Player")[0] # Get the first node in the group "Player"

func _process(delta):
	if target.can_hook:
		#translation.y += 1 * delta
		pass

func _on_Lava_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().reload_current_scene()