extends CharacterBody2D

const SPEED = 300.0

func _physics_process(delta):
	
	velocity *= 0.99
	
	var dir = -Vector2(0, 1).rotated(get_transform().get_rotation())

	if Input.is_action_pressed("player_forward"):
		velocity = dir * SPEED
	if Input.is_action_pressed("player_rotate_left"):
		rotate(-0.1)
	if Input.is_action_pressed("player_rotate_right"):
		rotate(0.1)

	move_and_slide()
