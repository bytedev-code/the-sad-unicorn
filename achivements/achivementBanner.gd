extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _on_timer_timeout():
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0, 1).set_ease(Tween.EASE_IN)
	
	
func setAchivement(achivement):
	$Panel/HBoxContainer/MarginContainer2/Label.text = achivement["name"]
	$Panel/HBoxContainer/MarginContainer/TextureRect.texture = achivement["texture"]


func _on_kill_timer_timeout():
	self.queue_free()
