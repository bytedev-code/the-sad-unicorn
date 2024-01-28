extends Control

var save:SaveData = SaveData.new()
var achivementItem = preload("res://menu/achivementItem.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	updateSize()
	get_viewport().size_changed.connect(updateSize)
	for achivement in save.achivements:
		var item = achivementItem.instantiate()
		item.custom_minimum_size.y = 100
		item.setAchivement(achivement)
		$ScrollContainer/MarginContainer/VBoxContainer.add_child(item)
		
func updateSize():
	$ScrollContainer.size.y = get_viewport().size.y - 200


func _on_back_btn_button_down():
	get_tree().change_scene_to_file("res://menu/menu.tscn")

func _input(ev):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().change_scene_to_file("res://menu/menu.tscn")
		
func _on_mouse_entered():
	print("hover")
	var tween = create_tween()
	tween.tween_property($Panel, "scale:y", 1.1, .5).set_ease(Tween.EASE_OUT)
	tween.parallel().tween_property($Panel, "scale:x", 1.1,.5).set_ease(Tween.EASE_OUT)
