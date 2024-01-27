class_name Enemy
extends RigidBody2D

signal on_split(blueprint: PackedScene, number: int, position: Vector2)
signal on_death(score: int)

@export var ROTATE: bool = true
@export var SPEED: float = 100.
@export var SPLIT_INTO: PackedScene = null
@export var SPLIT_NUMBER: int = 3
@export var SCORE: int = 10

var _direction = Vector2(0, 0)
var _rot_speed = 0.1

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	_direction = Vector2.from_angle(rng.randf() * 2 * PI)
	_rot_speed = rng.randf_range(-0.1, 0.1)
	set_contact_monitor(true)
	set_max_contacts_reported(1)


func setup(start_pos: Vector2i):
	position = start_pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var motion = _direction * SPEED * delta
	move_and_collide(motion)
	
	if ROTATE:
		rotate(_rot_speed)
	
	Globals.screen_wrap(self)
	
func _on_collide(node: Node):
	print("COLLIDE2 " + self.name)
	if node is Player:
		return
		
	if node is Projectile:
		node.queue_free()
		
	if node is Enemy:
		_direction = -_direction
		return
	
	if SPLIT_INTO:
		on_split.emit(SPLIT_INTO, SPLIT_NUMBER, position)
	
	on_death.emit(SCORE)
	queue_free()
