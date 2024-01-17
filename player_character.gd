extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta):
	# Get the input direction, negative or positive
	var direction_x = Input.get_axis("ui_left", "ui_right")
	var direction_y = Input.get_axis("ui_up", "ui_down")
	
	# if x-direction non-zero, velocity on x axis is neg/pos * speed constant
	if direction_x:
		velocity.x = direction_x * SPEED
	# if x-direction is zero (input stops), no movement
	else:
		velocity.x = 0
	# if y-direction non-zero, velocity on x axis is neg/pos * speed constant
	if direction_y:
		velocity.y = direction_y * SPEED
	# if y-direction is zero (input stops), no movement
	else:
		velocity.y = 0

	move_and_slide()
