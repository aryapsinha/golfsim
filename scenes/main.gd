extends Node2D
const MAXPOW = 8.0
var takeshot : bool
const MT = 5.0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var moving = false;
	if $Ball.linear_velocity.length() >= MT:
		moving = true
	if not moving:
		if not takeshot:
			takeshot = true
			$Ball.sleeping = true
			show_club()
			
	else:
		if takeshot:
			takeshot = false
			hide_club()
		
	

func show_club():
	$club.set_process(true)
	$club.position = $Ball.position
	$club.show()
	print("show")
func hide_club():
	$club.set_process(false)
	$club.hide()
	
	print("hidw")


func _on_club_shoot(power):
	$Ball.apply_central_impulse(power) # Replace with function body.
