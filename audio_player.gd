extends Node2D
class_name AudioPlayer

@export var stream1 := AudioStream
@export var stream2 := AudioStream
@export var stream3 := AudioStream

var game : Node

func _ready() -> void:
	var enemy = get_parent()
	enemy.on_death.connect(_on_death)
	enemy.on_shoot.connect(_on_shoot)

func _on_death() -> void:
	print("on death")
	
func _on_shoot() -> void:
	print("on shoot")
