extends Area

var target
var distance
var speed = .8
func _ready():
	target = get_tree().get_nodes_in_group("Player")[0] # Get the first node in the group "Player"

func _process(delta):
	distance = target.translation.y - translation.y
	print(distance)
	
	if target.can_hook and translation.y < 10:
		translation.y += speed * delta
		if distance > 10:
			speed = 5
		elif distance > 6:
			speed = 1
		else:
			speed = 0.3

func _on_Lava_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().reload_current_scene()
