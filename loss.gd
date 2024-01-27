extends Control

var unicornHappy = preload("res://assets/enemies/unicorn_happy.png")
var unicornSad = preload("res://assets/enemies/unicorn_sad.png")


func _toggle_rotation():
	$Unicorn1.rotation = -$Unicorn1.rotation 
	$Unicorn2.rotation = -$Unicorn2.rotation 


func _enter_TryAgain():
	$Unicorn1.texture = unicornHappy
	$Unicorn2.texture = unicornHappy


func _exit_tryAgain():
	$Unicorn1.texture = unicornSad
	$Unicorn2.texture = unicornSad


func _on_tryAgain():
	get_tree().change_scene_to_file("res://game.tscn")


func _on_menu():
	get_tree().change_scene_to_file("res://menu.tscn")
