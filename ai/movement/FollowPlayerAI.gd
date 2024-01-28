class_name FollowPlayerAI
extends MovementAI

func _process(delta):
	var player_pos = get_tree().get_root().get_node("game").find_child("player").position
	
	var direction = _parent.position.direction_to(player_pos)	
	
	var motion = direction * _speed * delta
	_parent.move_and_collide(motion)
	
	Globals.screen_wrap(_parent)

