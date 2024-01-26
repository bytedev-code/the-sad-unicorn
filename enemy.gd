extends RigidBody2D


var _direction = Vector2(0, 0)
var _speed = 100.

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	_direction = Vector2.from_angle(rng.randf() * 2 * PI)
	_speed = rng.randf() * 50 + 50


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var motion = _direction * _speed * delta
	move_and_collide(motion)
