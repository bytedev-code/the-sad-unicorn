extends Node2D
class_name AudioPlayer


@export var death_stream1 : AudioStream
@export var death_stream2 : AudioStream
@export var death_stream3 : AudioStream
@export var shoot_stream1 : AudioStream
@export var shoot_stream2 : AudioStream
@export var shoot_stream3 : AudioStream

var enemy_or_player : Node
var enemy_audio_stream_player: AudioStreamPlayer 

var death_streams : Array
var shoot_streams : Array

func _ready() -> void:
	enemy_or_player = get_parent()
	if enemy_or_player is Enemy:
		enemy_or_player.on_death.connect(_on_death)
	else:
		enemy_or_player.on_lost.connect(_on_lost)
		enemy_or_player.on_damage.connect(_on_damage)
	enemy_or_player.on_shoot.connect(_on_shoot)
	enemy_audio_stream_player = get_tree().get_first_node_in_group("enemy_audio_stream_player")
	if death_stream1 is AudioStream:
		death_streams.append(death_stream1)
	else:
		death_streams.append(load("res://assets/sounds/fart3.mp3"))
	if death_stream2 is AudioStream:
		death_streams.append(death_stream2)
	else:
		death_streams.append(load("res://assets/sounds/fart2.mp3"))
	if death_stream3 is AudioStream:
		death_streams.append(death_stream3)
	else:
		death_streams.append(load("res://assets/sounds/wiehern2.mp3"))
	if shoot_stream1 is AudioStream:
		shoot_streams.append(shoot_stream1)
	if shoot_stream2 is AudioStream:
		shoot_streams.append(shoot_stream2)
	if shoot_stream3 is AudioStream:
		shoot_streams.append(shoot_stream3)
	randomize()

func _on_lost(_enemy) -> void:
	#print("on lost")
	if death_streams.size() > 0:
		enemy_audio_stream_player.stream = death_streams[randi() % death_streams.size()]
		enemy_audio_stream_player.play()

func _on_damage(hp, _enemy) -> void:
	if hp > 0:
		enemy_audio_stream_player.stream = load("res://assets/sounds/donkey_short.mp3")
		enemy_audio_stream_player.play()
		
	
func _on_death(_score, _enemy) -> void:
	if death_streams.size() > 0:
		enemy_audio_stream_player.stream = death_streams[randi() % death_streams.size()]
		enemy_audio_stream_player.play()
	
func _on_shoot() -> void:
	#print("on_shoot", enemy_or_player)
	if shoot_streams.size() > 0:
		enemy_audio_stream_player.stream =  shoot_streams[randi() % shoot_streams.size()]
		enemy_audio_stream_player.play()

