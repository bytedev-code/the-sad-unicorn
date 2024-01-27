extends Node2D

signal on_gamestart(mode: String)
signal on_gamelost(mode: String)
signal on_gamewon(mode: String)
signal on_score_changed(score: int)

@export var enemy_blueprints: Array[PackedScene] = []
@export var unicorn_blueprint: PackedScene = null
@export var enemy_container: NodePath
@export var BOSS_SCORE_THRESHOLD: int = 100

var rng = RandomNumberGenerator.new()
var _score = 0
var _unicorn_spawned = false

# Called when the node enters the scene tree for the first time.
func _ready():
	_score = 0
	for i in range(2):
		_spawn_random_enemy()
	
	on_gamestart.emit()

func _spawn_unicorn():
	_unicorn_spawned = true
	var unicorn = unicorn_blueprint.instantiate()
	unicorn.position = Vector2(0, 200)
	_clear_enemies()
	_add_enemy(unicorn)
	
func _spawn_random_enemy():
	var blueprint_index = rng.randi_range(0, enemy_blueprints.size()-1)
	var blueprint = enemy_blueprints[blueprint_index]
	var enemy = blueprint.instantiate()
	enemy.position = Vector2(
		rng.randf_range(0, 1000),
		rng.randf_range(0, 800)
	)
	_add_enemy(enemy)

func _clear_enemies():
	for c in get_node(enemy_container).get_children():
		get_node(enemy_container).remove_child(c)
		c.queue_free()

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
	if _score > BOSS_SCORE_THRESHOLD and not _unicorn_spawned:
		_spawn_unicorn()

func _on_lost():
	on_gamelost.emit("default")
