extends Node

var x
var y
@onready var initial_x = $BallBody.position.x
@onready var initial_y = $BallBody.position.y
	

func _process(delta):
	if Input.is_action_just_pressed("retry"):
		get_tree().reload_current_scene()
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
		
func _physics_process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()
	
	x = $BallBody.position.x
	y = $BallBody.position.y

func shoot():
	var offset
	var impulse
	
	var angle = $Sliders/AngleSlider.value 
	var force = $Sliders/ForceSlider.value
	
	offset = Vector2(0,0)
	impulse = get_impulse_vector(angle, force)
	
	$BallBody.apply_impulse(impulse, offset)
	
func get_impulse_vector(angle, size):
	#convert angle to radians
	angle = angle * PI / 100
	# get x and y components of impuse vector
	var fx = size * cos(angle)
	var fy = size * sin(angle)
	
	var out = Vector2(fx, fy)
	
	return out
	
	
	
