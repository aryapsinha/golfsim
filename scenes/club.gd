extends Sprite2D
var power : float = 0.0
var power_dir : int = 1
signal shoot
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#global_position = get_global_mouse_position()
	var mouse_pos := get_global_mouse_position()
	look_at(get_global_mouse_position())
	var joydir
	
	if(Input.get_connected_joypads().size() > 0):
		
		joydir = Input.get_vector("left", "right", "up", "down")
	
		rotation = joydir.angle()
	#make the above compatible with controllers -- look up tutorial
	
	if Input.is_action_pressed("press"):
		power += 0.05 * power_dir
		if power > get_parent().MAXPOW:
			power = 0; 
			power_dir = -1
			
		elif power <= 0:
			power_dir = 1
		#Input.start_joy_vibration(0, 0.5, 0.5)
	else:
		if power > 0: 
			var dir = mouse_pos - position
			if(Input.get_connected_joypads().size() > 0):
				dir = joydir - position
			shoot.emit(power * dir) #when pos is set to global, movement is much slower 
			print(mouse_pos)
			
			power = 0; 
		#nput.stop_joy_vibration(0)
		#for controllers, the equivalent will be dragging the joystick back?
		#or the second joystick 
