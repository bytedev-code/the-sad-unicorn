extends Control
var save:SaveData = SaveData.new()
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	if save.data["game"]["started"]["total"] > 0:
		$VBoxContainer/continue_btn.disabled=false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_continue_btn_button_down():
	get_tree().change_scene_to_file("res://game.tscn")


func _on_new_game_btn_button_down():
	if save.data["game"]["started"]["total"] > 0:
		$ConfirmationDialog.position = $VBoxContainer.position
		$ConfirmationDialog.visible = true
	else:
		_on_confirmation_dialog_confirmed()


func _on_options_btn_button_down():
	get_tree().change_scene_to_file("res://menu/Options.tscn")


func _on_achivements_btn_button_down():
	get_tree().change_scene_to_file("res://menu/achivements.tscn")


func _on_back_btn_button_down():
	get_tree().quit()
	
func _input(ev):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()


func _on_confirmation_dialog_confirmed():
	save.resetGame()
	get_tree().change_scene_to_file("res://game.tscn")


func _on_btn_mouse_entered() -> void:
	audio_stream_player.play()

