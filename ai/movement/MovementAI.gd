class_name MovementAI
extends Node2D


var _parent: RigidBody2D
var _speed: float = 200

# Called when the node enters the scene tree for the first time.
func _init(parent: RigidBody2D, speed: float):
	_parent = parent
	_speed = speed
