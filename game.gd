class_name GameManager 
extends Node2D

signal on_gamestart(mode: String)
signal on_gamelost(mode: String)
signal on_gamewon(mode: String)
signal on_score_changed(score: int, enemy:String)

var rng = RandomNumberGenerator.new()
var _score = 0
var mode = "default"

# Called when the node enters the scene tree for the first time.
func _ready():
	get_viewport().size_changed.connect(fixBackground)
	fixBackground()
	_score = 0
	
	on_gamestart.emit(mode)

func fixBackground():
	$Background.size = get_viewport().size

func _on_lost(enemy:String):
	on_gamelost.emit(mode)

func add_score(score: int, name: String):
	_score += score
	on_score_changed.emit(_score, name)

func get_score() -> int:
	return _score
	
func set_gamewon():
	on_gamewon.emit(mode)
