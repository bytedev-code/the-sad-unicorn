extends Node2D

signal on_gamestart()

@export var enemy_blueprints: Array[PackedScene] = []
@export var enemy_container: NodePath

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(2):
		var enemy = enemy_blueprints[0].instantiate()
		enemy.position = Vector2(
			rng.randf_range(0, 1000),
			rng.randf_range(0, 800)
		)
		get_node(enemy_container).add_child(enemy)
	on_gamestart.emit()

