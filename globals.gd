extends Node2D

func screen_wrap(node: Node2D):
	var screen_size = get_viewport_rect().size
	var halfSpriteSize = node.get_node("Sprite2D").get_texture().get_size() * 0.5
	var originalPosition = node.position
	var position = originalPosition
	position.x = 0 - halfSpriteSize.x if position.x > screen_size.x + halfSpriteSize.x else position.x
	position.x = screen_size.x + halfSpriteSize.x if position.x < 0 - halfSpriteSize.x else position.x
	position.y = 0 - halfSpriteSize.y if position.y > screen_size.y + halfSpriteSize.y else position.y
	position.y = screen_size.y + halfSpriteSize.y if position.y < 0 - halfSpriteSize.y else position.y
	var wrapped = position != originalPosition
	if wrapped:
		node.position = position
	return wrapped
