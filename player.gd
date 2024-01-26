extends CharacterBody2D

signal on_damage(hp: int)
signal on_lost()

@export var SPEED: float = 300.0
@export var INIT_HP: int = 3

var _hp = 3
var _is_invincible = false

@onready var InvincibleTimer = $InvincibleTimer

func _ready():
	_hp = INIT_HP
	_is_invincible = true
	InvincibleTimer.timeout.connect(_on_invincible_gone)
	InvincibleTimer.start()

func _physics_process(delta):
	
	velocity *= 0.99
	
	var dir = -Vector2(0, 1).rotated(get_transform().get_rotation())

	if Input.is_action_pressed("player_forward"):
		velocity = dir * SPEED
	if Input.is_action_pressed("player_rotate_left"):
		rotate(-0.1)
	if Input.is_action_pressed("player_rotate_right"):
		rotate(0.1)

	move_and_slide()
	
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
