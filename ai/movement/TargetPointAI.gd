class_name TargetPointAI
extends Node2D

var rng = RandomNumberGenerator.new()

var _parent: RigidBody2D
var _speed: float = 200
var _target_location: Vector2

func _init(parent: RigidBody2D, speed):
	_parent = parent
	_speed = speed
	_plan_target_location()
	
func _plan_target_location():
	var screen_size = get_viewport_rect().size
	
	_target_location = Vector2(
		rng.randf_range(1, screen_size.x-1),
		rng.randf_range(1, screen_size.y-1)
	)

func _process(delta):
	print("try to reach ", _target_location)
	var direction = position.direction_to(_target_location)	
	
	if _parent.position.distance_to(_target_location) < 10:
		_plan_target_location()
	
	var motion = direction * _speed * delta
	_parent.move_and_collide(motion)

