class_name Enemy 
extends RigidBody2D

signal on_split(blueprint: PackedScene, number: int, position: Vector2)
signal on_death(score: int, enemy:String)
signal on_score(score: int)
signal on_collide()
signal on_hit()
signal on_shoot()

enum MoveType {RANDOM, HORIZONTAL}

@export var ROTATE: bool = true
@export var SPEED: float = 100.
@export var SPLIT_INTO: PackedScene = null
@export var SPLIT_NUMBER: int = 3
@export var SCORE: int = 10
@export var IGNORE_PLAYER_HIT: bool = false
@export var HITPOINTS: int = 5
@export var ENEMY_PROJECTILE: PackedScene = null
@export var MOVETYPE: MoveType = MoveType.RANDOM

var _direction = Vector2(0, 0)
var _rot_speed = 0.1
var _hp = 5

var rng = RandomNumberGenerator.new()
var dmg_indicator = DamageIndicator.new()
var movement_ai = null

# Called when the node enters the scene tree for the first time.
func _ready():
	dmg_indicator.SPRITE = "../Sprite2D"
	on_hit.connect(dmg_indicator.on_hit_slot)
	add_child(dmg_indicator)
	
	movement_ai = TargetPointAI.new(self, SPEED)
	add_child(movement_ai)
	movement_ai._plan_target_location()

	_rot_speed = rng.randf_range(-0.1, 0.1)
	_hp = HITPOINTS
	
	set_contact_monitor(true)
	set_max_contacts_reported(1)


func setup(start_pos: Vector2i):
	position = start_pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ROTATE:
		rotate(_rot_speed)
	
	Globals.screen_wrap(self)
	
func deal_damage():
	_hp -= 1
	
	on_hit.emit()
	
	if _hp <= 0:
		var death_particles = DeathParticles.new()
		death_particles.position = position
		death_particles.texture = get_node("./Sprite2D").get_texture()
		get_tree().get_root().add_child(death_particles)
		
		on_score.emit(SCORE)
		on_death.emit(SCORE, self.name)
		
		if SPLIT_INTO:
			on_split.emit(SPLIT_INTO, SPLIT_NUMBER, position)
		queue_free()

func _on_collide(node: Node):
	if node is Player:
		var player_dir = node.get_direction()
		_direction = player_dir
		on_collide.emit()
		
	if node is Enemy:
		_direction = -_direction
		on_collide.emit()
