class_name Boss
extends Enemy

var _target_location: Vector2
@export var DEATH_TEXTURE: Texture2D
var _stop = false

func _plan_target_location():
	var screen_size = get_viewport_rect().size
	
	_target_location = Vector2(
		rng.randf_range(1, screen_size.x-1),
		rng.randf_range(1, screen_size.y-1)
	)
	
	
func _on_collide(node: Node):
	if node is Player:
		on_collide.emit()


func deal_damage():
	_hp -= 1
	
	on_hit.emit()
	
	if _hp <= 0:
		on_death.emit(SCORE)
		$Sprite2D.set_texture(DEATH_TEXTURE)
		_stop = true
		await get_tree().create_timer(1.0).timeout # waits for 1 second
		on_death.emit(0, self.name)
	
		

func _process(delta):
	if _stop:
		return
		
	var direction = position.direction_to(_target_location)
	
	var motion = direction * SPEED * delta
	move_and_collide(motion)

	Globals.screen_wrap(self)

	if position.distance_to(_target_location) < 10:
		_plan_target_location()
