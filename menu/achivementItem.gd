extends Control
var notReachedTheme = preload("res://menu/AchivementItmeDisabled_theme.tres")
var itemTheme = preload("res://menu/AchivementItme_theme.tres")
var lockedIcon = preload("res://menu/lock-solid.svg")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
#
func setAchivement(achivement):
	if(achivement["reached"]):
		$Panel/HBoxContainer/MarginContainer2/Label.text = achivement["name"]
		$Panel/HBoxContainer/MarginContainer/TextureRect.texture = achivement["texture"]
	else:
		$Panel.theme = notReachedTheme
		$Panel/HBoxContainer/MarginContainer2/Label.text = achivement["name"]
		$Panel/HBoxContainer/MarginContainer/TextureRect.texture = lockedIcon
	


	
	

	pass # Replace with function body.


func _on_mouse_exited():
	pass # Replace with function body.


var anime_speed = .2

func _on_panel_mouse_entered():
	var tween = create_tween()
	tween.tween_property($Panel, "scale:y", 1.1, anime_speed).set_ease(Tween.EASE_OUT)
	tween.parallel().tween_property($Panel, "scale:x", 1.1,anime_speed).set_ease(Tween.EASE_OUT)


func _on_panel_mouse_exited():
	var tween = create_tween()
	tween.tween_property($Panel, "scale:y", 1, anime_speed).set_ease(Tween.EASE_OUT)
	tween.parallel().tween_property($Panel, "scale:x", 1,anime_speed).set_ease(Tween.EASE_OUT)

