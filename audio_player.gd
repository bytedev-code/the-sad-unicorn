extends Node2D
class_name AudioPlayer


@export var death_stream1 : AudioStream
@export var death_stream2 : AudioStream
@export var death_stream3 : AudioStream
@export var shoot_stream1 : AudioStream
@export var shoot_stream2 : AudioStream
@export var shoot_stream3 : AudioStream

var enemy : Node
var enemy_audio_stream_player: AudioStreamPlayer 

var death_streams : Array
var shoot_streams : Array

func _ready() -> void:
	enemy = get_parent()
	enemy.on_death.connect(_on_death)
	enemy.on_shoot.connect(_on_shoot)
	enemy_audio_stream_player = get_tree().get_first_node_in_group("enemy_audio_stream_player")
	if death_stream1 is AudioStream:
		death_streams.append(death_stream1)
	if death_stream2 is AudioStream:
		death_streams.append(death_stream2)
	if death_stream3 is AudioStream:
		death_streams.append(death_stream3)
	if shoot_stream1 is AudioStream:
		shoot_streams.append(shoot_stream1)
	if shoot_stream2 is AudioStream:
		shoot_streams.append(shoot_stream2)
	if shoot_stream3 is AudioStream:
		shoot_streams.append(shoot_stream3)
	randomize()

func _on_death(_score, _enemy) -> void:
	if death_streams.size() > 0:
		enemy_audio_stream_player.stream = death_streams[randi() % death_streams.size()]
		enemy_audio_stream_player.play()
	
func _on_shoot() -> void:
	if shoot_streams.size() > 0:
		enemy_audio_stream_player.stream =  shoot_streams[randi() % shoot_streams.size()]
		enemy_audio_stream_player.play()

