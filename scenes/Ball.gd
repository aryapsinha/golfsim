extends RigidBody2D

'''
func _process(delta):
	var velocity = Input.get_vector("left", "right", "up", "down")
	

extends CharacterBody2D
@export var power = 50; 
var activated = false
var speed = 100.0;
func _physics_process(delta):
	var direction := Vector2(
		# This first line calculates the X direction, the vector's first component.
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		# And here, we calculate the Y direction. Note that the Y-axis points 
		# DOWN in games.
		# That is to say, a Y value of `1.0` points downward.
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	# When aiming the joystick diagonally, the direction vector can have a length 
	# greater than 1.0, making the character move faster than our maximum expected
	# speed. When that happens, we limit the vector's length to ensure the player 
	# can't go beyond the maximum speed.
	velocity = direction*power
	
	move_and_slide()
	velocity = velocity.lerp(Vector2(0,0), 0.1*delta)
	if(!activated and direction != Vector2(0,0)):
		activated = true
		friction(power, direction)
		print("test") 
	
	velocity = direction * power
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	if direction.length() > 1.0:
		direction = direction.normalized()
	velocity.x = lerp(velocity.x, 0.0, 0.5)	
	velocity.y = lerp(velocity.y, 0.0, 0.5)	
	
		
		
if(activated and power == 0):
		power = 5
		activated = false
	if Input.is_anything_pressed() and direction != Vector2(0,0) and !activated:
		velocity = power * direction
		activated = true
		print("test")
		await get_tree().create_timer(1).timeout
		activated = false
		
	else:
		velocity.lerp(Vector2(0,0), 0.5)
		print(velocity) '''
		

	#elocity = Vector2(0,0)
	
'''
func friction(power, direction):
	while(power > 0):
		velocity = power * direction 
		if velocity.length() > 0:
			velocity = velocity.normalized() * speed
		if direction.length() > 1.0:
			direction = direction.normalized()
		power = power - 0.5
		velocity.lerp(Vector2(0,0), 0.7)
		#velocity.y = lerp(velocity.y, 0.0, 1)
		#if(power <= 0):
			#velocity = Vector2(0,0)
			
		move_and_slide()
	
	velocity = direction * power
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	if direction.length() > 1.0:
		direction = direction.normalized()
	velocity.x = lerp(velocity.x, 0.0, 0.1)	
	velocity.y = lerp(velocity.y, 0.0, 0.1)	
	velocity = power * direction
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	if direction.length() > 1.0:
		direction = direction.normalized()
	await get_tree().create_timer(1).timeout
	activated = false '''

