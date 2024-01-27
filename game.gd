extends Node2D

signal on_gamestart()
signal on_gamelost()
signal on_score_changed(score: int)

@export var enemy_blueprints: Array[PackedScene] = []
@export var enemy_container: NodePath

var rng = RandomNumberGenerator.new()
var _score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	_score = 0
	for i in range(2):
		var enemy = enemy_blueprints[0].instantiate()
		enemy.position = Vector2(
			rng.randf_range(0, 1000),
			rng.randf_range(0, 800)
		)
		_add_enemy(enemy)
	on_gamestart.emit()

func _add_enemy(enemy: Enemy):
	enemy.on_split.connect(_on_enemy_split)
	enemy.on_death.connect(_on_enemy_death)
	get_node(enemy_container).call_deferred("add_child", enemy)

func _on_enemy_split(blueprint: PackedScene, split_number: int, start_pos: Vector2):
	for i in range(split_number):
		var split_enemy: Enemy = blueprint.instantiate()
		split_enemy.setup(start_pos)
		_add_enemy(split_enemy)

func _on_enemy_death(score: int):
	_score += score
	on_score_changed.emit(_score)

func _on_lost():
	on_gamelost.emit()
