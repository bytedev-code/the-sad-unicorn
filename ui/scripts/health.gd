extends Node

var maxHealth = 3
var heart = preload("res://ui/healthIcons/clownHeart.png")
var emptyHeart = preload("res://ui/healthIcons/clownHeartEmpty.png")
var hearts = []

# Called when the node enters the scene tree for the first time.
func _ready():
	createHealth()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func createHealth():
	print("CREATE ")
	for i in maxHealth:
		var child = TextureRect.new()
		child.texture = heart
		child.expand_mode = TextureRect.EXPAND_FIT_WIDTH
		self.add_child(child)
		hearts.append(child)
		
func setMaxHealth(health:int):
	self.maxhealth = health
	createHealth()
	
		
func setHealth(health:int):
	for i in range(hearts.size()):
		if i < health:
			self.hearts[hearts.size() - 1 -i].texture = self.heart
		else:
			self.hearts[hearts.size() - 1 -i].texture = self.emptyHeart
