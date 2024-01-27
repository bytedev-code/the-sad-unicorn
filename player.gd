class_name Player
extends CharacterBody2D

signal on_damage(hp: int, enemy: String)
signal on_shoot()
signal on_lost(enemy: String)

@export var SPEED: float = 30.0
@export var INIT_HP: int = 3

@export var PROJECTILE_NODE: NodePath = "."
@export var PROJECTILE_BLUEPRINT: PackedScene = preload("res://blueprints/projectiles/haha.tscn")

var _impulse = Vector2.ZERO
var _apply_impulse = false

var _hp = 3
var _is_invincible = false
var _is_shoot_oncolldown = false

@onready var screen_size = get_viewport_rect().size

@onready var InvincibleTimer = $InvincibleTimer
@onready var ShootCooldown: Timer = $ShootCooldown

var _blink_rising = false

func _ready():
	_hp = INIT_HP
	_is_invincible = true
	InvincibleTimer.timeout.connect(_on_invincible_gone)
	InvincibleTimer.start()
	
func get_direction() -> Vector2:
	return -Vector2(0, 1).rotated(get_transform().get_rotation())

func _process(delta):
	if _is_invincible:
		if _blink_rising:
			$Sprite2D.modulate.a += 0.05
		else:
			$Sprite2D.modulate.a -= 0.05
			
		if $Sprite2D.modulate.a < 0.5:
			_blink_rising = true
		if $Sprite2D.modulate.a > 0.9:
			_blink_rising = false
	else:
		$Sprite2D.modulate.a = 1.0

func _physics_process(delta):
	
	velocity *= 0.99

	if not _apply_impulse:
		if Input.is_action_pressed("player_forward"):
			velocity += get_direction() * SPEED
		if Input.is_action_pressed("player_rotate_left"):
			rotate(-0.1)
		if Input.is_action_pressed("player_rotate_right"):
			rotate(0.1)
			
	if Input.is_action_pressed("player_shoot"):
		_spawn_projectile()

	if _apply_impulse:
		print(velocity)
		velocity = _impulse * SPEED * 10
		print(velocity)
		_apply_impulse = false

	move_and_slide()
	
	Globals.screen_wrap(self)
	
	if get_slide_collision_count() > 0 and not _is_invincible:
		var coll = get_slide_collision(0)
		if coll.get_collider() is Enemy:
			deal_damage(coll.get_collider())
		if coll.get_collider() is Boss:
			add_impulse(get_direction() * -5)
			

func add_impulse(impulse: Vector2):
	print("IMPULSE")
	_impulse = impulse
	_apply_impulse = true

func deal_damage(enemy):
	_hp -= 1
	_is_invincible = true
	InvincibleTimer.start()
	
	on_damage.emit(_hp, enemy.name)
	
	if _hp <= 0:
		on_lost.emit(enemy.name)
		
func _on_invincible_gone():
	_is_invincible = false

func _spawn_projectile():
	if ShootCooldown.is_stopped():
		var projectile: Projectile = PROJECTILE_BLUEPRINT.instantiate()
		projectile.setup(position + get_direction()*100, get_direction())
		get_node(PROJECTILE_NODE).add_child(projectile)
		ShootCooldown.start()
		on_shoot.emit()
