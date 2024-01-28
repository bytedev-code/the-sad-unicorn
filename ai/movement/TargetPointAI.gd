class_name TargetPointAI
extends MovementAI

var rng = RandomNumberGenerator.new()

var _target_location: Vector2

	
func _ready():
	_plan_target_location()
	
func _plan_target_location():
	var screen_size = get_viewport_rect().size
	
	_target_location = Vector2(
		rng.randf_range(1, screen_size.x-1),
		rng.randf_range(1, screen_size.y-1)
	)

func _process(delta):
	var direction = _parent.position.direction_to(_target_location)	
	
	if _parent.position.distance_to(_target_location) < 10:
		_plan_target_location()
	
	var motion = direction * _speed * delta
	_parent.move_and_collide(motion)
	
	Globals.screen_wrap(_parent)

