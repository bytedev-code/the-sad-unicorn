class_name Enemy 
extends RigidBody2D

signal on_split(blueprint: PackedScene, number: int, position: Vector2)
signal on_death(score: int)
signal on_collide()
signal on_hit()
signal on_shoot()

@export var ROTATE: bool = true
@export var SPEED: float = 100.
@export var SPLIT_INTO: PackedScene = null
@export var SPLIT_NUMBER: int = 3
@export var SCORE: int = 10
@export var IGNORE_PLAYER_HIT: bool = false
@export var HITPOINTS: int = 5

var _direction = Vector2(0, 0)
var _rot_speed = 0.1
var _hp = 5

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	_direction = Vector2.from_angle(rng.randf() * 2 * PI)
	_rot_speed = rng.randf_range(-0.1, 0.1)
	_hp = HITPOINTS
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
	
func deal_damage():
	_hp -= 1
	
	on_hit.emit()
	
	if _hp <= 0:
		if SPLIT_INTO:
			on_split.emit(SPLIT_INTO, SPLIT_NUMBER, position)
		
		on_death.emit(SCORE)
		queue_free()

func _on_collide(node: Node):
	if node is Player:
		var player_dir = node.get_direction()
		_direction = player_dir
		on_collide.emit()
		
	if node is Enemy:
		_direction = -_direction
		on_collide.emit()
