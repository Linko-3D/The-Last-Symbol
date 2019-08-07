extends Position3D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Timer.is_stopped():
		$Timer.start()
	print($OmniLight.light_energy)

func _on_Timer_timeout():
	$OmniLight.light_energy = rand_range(0.6,0.63)
	$OmniLight.light_indirect_energy = $OmniLight.light_energy
