class_name Boss
extends Enemy

var _target_location: Vector2
@export var DEATH_TEXTURE: Texture2D
var _stop = false
	
	
func _on_collide(node: Node):
	if node is Player:
		on_collide.emit()


func deal_damage():
	_hp -= 1
	
	on_hit.emit()
	
	if _hp <= 0:
		$Sprite2D.set_texture(DEATH_TEXTURE)
		_stop = true
		await get_tree().create_timer(1.0).timeout # waits for 1 second
		on_death.emit(SCORE, self.name)
	
		

func _process(delta):
	if _stop:
		return
	
	super._process(delta)

