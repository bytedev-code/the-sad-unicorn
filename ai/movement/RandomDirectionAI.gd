class_name RandomDirectionAI
extends MovementAI

var rng = RandomNumberGenerator.new()

var _direction: Vector2

# Called when the node enters the scene tree for the first time.
func _init(parent: RigidBody2D, speed: float):
	super(parent, speed)
	_direction = Vector2.from_angle(rng.randf() * 2 * PI)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var motion = _direction * _speed * delta
	_parent.move_and_collide(motion)
	
	Globals.screen_wrap(_parent)

func set_direction(direction: Vector2):
	_direction = direction
