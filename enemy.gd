class_name Enemy
extends RigidBody2D

@export var ROTATE: bool = true
@export var SPEED: float = 100.

var _direction = Vector2(0, 0)
var _rot_speed = 0.1

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	_direction = Vector2.from_angle(rng.randf() * 2 * PI)
	_rot_speed = rng.randf_range(-0.1, 0.1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var motion = _direction * SPEED * delta
	move_and_collide(motion)
	
	if ROTATE:
		rotate(_rot_speed)
	
	
	Globals.screen_wrap(self)
