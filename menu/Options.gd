extends Control

var save:SaveData = SaveData.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/HSlider.value = save.settings["volume"]


func _on_back_btn_button_down():
	get_tree().change_scene_to_file("res://menu/menu.tscn")

func _input(ev):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().change_scene_to_file("res://menu/menu.tscn")


func _on_h_slider_value_changed(value):
	save.settings["volume"] = value
	save.saveGame()
	var audioManager = get_node("/root/AudioManager")
	audioManager.setVolume()
	
