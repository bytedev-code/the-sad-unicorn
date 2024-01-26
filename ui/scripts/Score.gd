extends Label

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	text = str(score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func addScore(score:int):
	self.score += score
	text = str(score)
