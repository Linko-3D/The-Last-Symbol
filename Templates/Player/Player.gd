extends KinematicBody

export var speed = 8.5
export var jump_height = 9.0
export var mouse_sensitivity = 1.0

var can_hook = false

var ammo = 0

var vector = Vector3()
var gravity = 20.0


func _process(delta):
	$Camera/Crosshair.position = Vector2(OS.window_size.x / 2, OS.window_size.y / 2)
	$Camera/Crosshair.position = Vector2(OS.window_size.x / 2, OS.window_size.y / 2)


func _physics_process(delta):
	if ammo == 0:
		$Camera/Holding.visible = false
	else:
		$Camera/Holding.visible = true
	vector.x = 0
	vector.z = 0
	
	var UP = Input.is_action_pressed("ui_up")
	var DOWN = Input.is_action_pressed("ui_down")
	var LEFT = Input.is_action_pressed("ui_left")
	var RIGHT = Input.is_action_pressed("ui_right")
	var SPRINT = Input.is_action_pressed("sprint")
	
	vector += global_transform.basis.z * (-int(UP) + int(DOWN)) * speed 
	vector += global_transform.basis.x * (-int(LEFT) + int(RIGHT)) * speed 
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		vector.y = jump_height
	
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
	
	vector.y -= gravity * delta
	
	vector = move_and_slide(vector, Vector3.UP)

func _input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.relative.x * mouse_sensitivity / 10			# Look left and right
		$Camera.rotation_degrees.x = clamp($Camera.rotation_degrees.x - event.relative.y * mouse_sensitivity / 10, -90, 90) # Look up and down
