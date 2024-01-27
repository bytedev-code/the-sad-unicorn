extends Node2D
class_name AudioPlayer

var enemy_audio_stream_player: AudioStreamPlayer 

@export var death_stream : AudioStream
@export var shoot_stream : AudioStream

var enemy : Node

func _ready() -> void:
	enemy = get_parent()
	enemy.on_death.connect(_on_death)
	enemy.on_shoot.connect(_on_shoot)
	enemy_audio_stream_player = get_tree().get_first_node_in_group("enemy_audio_stream_player")

func _on_death(_score) -> void:
	enemy_audio_stream_player.stream = death_stream
	enemy_audio_stream_player.play()
	
func _on_shoot() -> void:
	enemy_audio_stream_player.stream = shoot_stream
	enemy_audio_stream_player.play()
