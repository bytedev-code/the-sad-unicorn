class_name Projectile
extends StaticBody2D


@export var SPEED = 500.
var _direction = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func setup(start_pos: Vector2, direction: Vector2):
	position = start_pos
	_direction = direction

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var motion = _direction * SPEED * delta
	var coll = move_and_collide(motion)
	
	if coll:
		var collider = coll.get_collider()
		if collider is Enemy:
			collider.deal_damage()
			_on_lifetime_end()

func _on_lifetime_end():
	queue_free()
