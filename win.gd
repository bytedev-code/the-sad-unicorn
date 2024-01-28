extends Control

var unicornHappy = preload("res://assets/enemies/unicorn_happy.png")
var unicornSad = preload("res://assets/enemies/unicorn_sad.png")
var unicornEvil = preload("res://assets/enemies/unicorn_evil.png")

func _ready():
	$Achivements.displayQueue()
	
func _toggle_rotation():
	$Unicorn1.rotation = -$Unicorn1.rotation 
	$Unicorn2.rotation = -$Unicorn2.rotation 


func _enter_Menu():
	$Unicorn1.texture = unicornSad
	$Unicorn2.texture = unicornSad
	


func _exit_Menu():
	$Unicorn1.texture = unicornHappy
	$Unicorn2.texture = unicornHappy


func _on_tryAgain():
	get_tree().change_scene_to_file("res://game.tscn")


func _on_menu():
	get_tree().change_scene_to_file("res://menu/menu.tscn")


func _enter_endless():
	$Unicorn1.texture = unicornEvil
	$Unicorn2.texture = unicornEvil


func _exit_endless():
	$Unicorn1.texture = unicornHappy
	$Unicorn2.texture = unicornHappy
