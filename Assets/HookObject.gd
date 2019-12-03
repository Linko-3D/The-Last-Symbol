extends Area

var target

func _ready():
	target = get_tree().get_nodes_in_group("Player")[0] # Get the first node in the group "Player"

func _on_HookObject_body_entered(body):
	if body == target:
		target.can_hook = true
		queue_free()
