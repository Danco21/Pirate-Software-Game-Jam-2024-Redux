extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta):
	# Get the input direction, axis direction is negative or positive
	var direction_x = Input.get_axis("ui_left", "ui_right")
	var direction_y = Input.get_axis("ui_up", "ui_down")
	
	# if (true), velocity on x axis is neg/pos with constant speed
	if direction_x:
		velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if direction_y:
		velocity.y = direction_y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
