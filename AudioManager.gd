extends Node2D
var save:SaveData = SaveData.new()

func _ready():
	setVolume()

func setVolume():
	save.loadGame()
	$BackgroundAudioStreamPlayer.volume_db = save.settings["volume"] - 50
