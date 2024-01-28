extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
#	TranslationServer.connect("locale_changed", Callable(self, "update_translations"))
	var es_translation = load("res://translations.es.translation")
	TranslationServer.add_translation(es_translation)
	var en_translation = load("res://translations.en.translation")
	TranslationServer.add_translation(en_translation)
	var de_translation = load("res://translations.de.translation")
	TranslationServer.add_translation(de_translation)
	$HowToContainer.visible = false
	TranslationServer.set_locale("en")
#	print(TranslationServer.get_translation_object("es").get_message_list())
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://game.tscn")
#	pass # Replace with function body.



func _on_how_to_button_pressed():
	$HowToContainer/HowToTextLabel.text = "Ein Text"
	$HowToContainer.visible = true
#	pass # Replace with function body.


func _on_how_to_close_button_pressed():
	$HowToContainer.visible = false
#	pass # Replace with function body.


func _on_language_button_item_selected(index):
	if index == 1:
		TranslationServer.set_locale("de")
#		$VBoxContainer/HBoxContainer/Buttons/LanguageButton.selected = 1
	else:
		TranslationServer.set_locale("en")
#		print("Sprache")
	update_translations()
#	pass # Replace with function body.

func update_translations():
#	print("update")
	$VBoxContainer/HBoxContainer/Buttons/HowToButton.text = TranslationServer.translate(&"HOW")
	$VBoxContainer/HBoxContainer/Buttons/AchieveButton.text = TranslationServer.translate(&"ACH")
	$VBoxContainer/HBoxContainer/Buttons/LanguageButton.set_item_text(0, TranslationServer.translate(&"ENG"))
	$VBoxContainer/HBoxContainer/Buttons/LanguageButton.set_item_text(1, TranslationServer.translate(&"DEU"))
#	for node in get_tree().get_nodes_in_group("text"):
#		if node is Button:
#			node.text = tr(node.text)
#			print(node.text)


func _on_credits_button_pressed():
	$HowToContainer/HowToTextLabel.text = "Ein anderer Text"
	$HowToContainer.visible = true
#	pass # Replace with function body.
