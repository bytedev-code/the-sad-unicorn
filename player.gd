extends CharacterBody2D

signal on_damage(hp: int)
signal on_lost()

@export var SPEED: float = 300.0
@export var INIT_HP: int = 3

@export var PROJECTILE_NODE: NodePath = "."
@export var PROJECTILE_BLUEPRINT: PackedScene = preload("res://blueprints/projectiles/haha.tscn")

var _hp = 3
var _is_invincible = false
var _is_shoot_oncolldown = false

@onready var screen_size = get_viewport_rect().size

@onready var InvincibleTimer = $InvincibleTimer
@onready var ShootCooldown: Timer = $ShootCooldown

func _ready():
	_hp = INIT_HP
	_is_invincible = true
	InvincibleTimer.timeout.connect(_on_invincible_gone)
	InvincibleTimer.start()
	
func get_direction() -> Vector2:
	return -Vector2(0, 1).rotated(get_transform().get_rotation())

func _physics_process(delta):
	
	velocity *= 0.99

	if Input.is_action_pressed("player_forward"):
		velocity = get_direction() * SPEED
	if Input.is_action_pressed("player_rotate_left"):
		rotate(-0.1)
	if Input.is_action_pressed("player_rotate_right"):
		rotate(0.1)
	if Input.is_action_pressed("player_shoot"):
		_spawn_projectile()

	move_and_slide()
	
	Globals.screen_wrap(self)
	
	if get_slide_collision_count() > 0 and not _is_invincible:
		var collider = get_slide_collision(0)
		_get_damage()


func _get_damage():
	_hp -= 1
	_is_invincible = true
	InvincibleTimer.start()
	
	on_damage.emit(_hp)
	
	if _hp <= 0:
		on_lost.emit()
		
func _on_invincible_gone():
	_is_invincible = false

func _spawn_projectile():
	if ShootCooldown.is_stopped():
		var projectile: Projectile = PROJECTILE_BLUEPRINT.instantiate()
		projectile.setup(position + get_direction()*100, get_direction())
		get_node(PROJECTILE_NODE).add_child(projectile)
		ShootCooldown.start()
