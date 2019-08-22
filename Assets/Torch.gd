extends Spatial

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	randomize()
	$OmniLight.light_energy = rand_range(0.22, 0.25)
	$OmniLight.light_indirect_energy = rand_range(0.22, 0.25)
