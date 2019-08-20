extends Area

export (float) var offsetX
export (float) var offsetY
export (float) var offsetZ
export (float) var speed = 3
export (float) var start_pause
export (float) var end_pause

var moveTo = Vector3()
var starting_position = Vector3()
var forward = true

func _ready():
	starting_position = translation
	moveTo.x = starting_position.x + offsetX
	moveTo.y = starting_position.y + offsetY
	moveTo.z = starting_position.z + offsetZ

func _process(delta):
	rotate_x(0.03)
	rotate_y(0.03)
	rotate_z(0.03)
	
	if $Tween.is_active() == false: # Each time the animation stops check the direction set
		if forward:
			$Tween.start()
			$Tween.interpolate_property(self, "translation", translation, moveTo, speed, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, start_pause)
			forward = false
		else:
			$Tween.start()
			$Tween.interpolate_property(self, "translation", translation, starting_position, speed, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, end_pause)
			forward = true

func _on_Spikes_Ball_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().reload_current_scene()
