class_name EnemyGenerator
extends Node

@export var ENEMY_BLUEPRINTS: Array[PackedScene] = []
@export var UNICORN_BLUEPRINT: PackedScene = null
@export var ENEMY_CONTAINER: NodePath

@export var BOSS_SCORE_THRESHOLD: int = 100
@export var NEW_ENEMIES_THRESHOLD: int = 2
@export var GAME_MANAGER: NodePath

var rng = RandomNumberGenerator.new()
var _unicorn_spawned = false

var enemy_spawn_timer = Timer.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	enemy_spawn_timer.one_shot = false
	enemy_spawn_timer.wait_time = 2.0
	enemy_spawn_timer.autostart = true
	enemy_spawn_timer.timeout.connect(_spawn_new_enemies)
	add_child(enemy_spawn_timer)
	
	for i in range(2):
		_spawn_random_enemy()

func _spawn_new_enemies():
	if _unicorn_spawned:
		return
	if get_node(ENEMY_CONTAINER).get_child_count() < NEW_ENEMIES_THRESHOLD:
		for i in range(2):
			_spawn_random_enemy()


func _spawn_unicorn():
	_unicorn_spawned = true
	var unicorn = UNICORN_BLUEPRINT.instantiate()
	unicorn.position = Vector2(0, 200)
	_clear_enemies()
	_add_enemy(unicorn)
	
func _spawn_random_enemy():
	var blueprint_index = rng.randi_range(0, ENEMY_BLUEPRINTS.size()-1)
	var blueprint = ENEMY_BLUEPRINTS[blueprint_index]
	var enemy = blueprint.instantiate()
	enemy.position = Vector2(
		rng.randf_range(0, 1000),
		rng.randf_range(0, 800)
	)
	_add_enemy(enemy)

func _clear_enemies():
	for c in get_node(ENEMY_CONTAINER).get_children():
		get_node(ENEMY_CONTAINER).remove_child(c)
		c.queue_free()

func _add_enemy(enemy: Enemy):
	enemy.on_split.connect(_on_enemy_split)
	enemy.on_death.connect(_on_enemy_death)
	get_node(ENEMY_CONTAINER).call_deferred("add_child", enemy)

func _on_enemy_split(blueprint: PackedScene, split_number: int, start_pos: Vector2):
	if _unicorn_spawned:
		return
	for i in range(split_number):
		var split_enemy: Enemy = blueprint.instantiate()
		split_enemy.setup(start_pos)
		_add_enemy(split_enemy)

func _on_enemy_death(score: int, name:String):
	var gm: GameManager = get_node(GAME_MANAGER)
	gm.add_score(score, name)
	if gm.get_score() > BOSS_SCORE_THRESHOLD and not _unicorn_spawned:
		_spawn_unicorn()
	if name == UNICORN_BLUEPRINT._bundled["names"][0]:
		gm.set_gamewon()
