class_name SaveData extends Object

var achivements = preload("res://achivements/scripts/achivementsData.gd").new().achivements
var data = {}
var settings = {
	"volume":50
}
var template = {
	"queue": [],
	"enemies": {
		"killed": {
			"total":0,
		},
		"killed_by": {
			
		},
		"damageTaken": {
			"total":0,
		}
	},
	"game": {
		"started":{
			"total":0,
			"default":0,
		},
		"completed": {
			"total":0,
			"default":0,
		},
		"lost": {
			"total":0,
			"default":0,
			"endless":0,
		},
		"bestscore":0,
	}
}

func _init():
	loadGame()


func saveGame():
	var save_game = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	var json_data = JSON.stringify(data)
	var json_settings_data = JSON.stringify(settings)
	save_game.store_line(json_data)
	save_game.store_line(json_settings_data)
	
func resetGame():
	var dir = DirAccess.open("user://")
	if dir.file_exists("user://savegame.save"):
		dir.remove("user://savegame.save")
	data = template
	saveGame()
	for achivement in achivements:
		achivement["reached"] = false
	
	
func loadGame():
	if not FileAccess.file_exists("user://savegame.save"):
		resetGame()
		return
	var save_game = FileAccess.open("user://savegame.save", FileAccess.READ)
	var json_string = save_game.get_line()
	var json_settings_string = save_game.get_line()

	# Creates the helper class to interact with JSON
	var json = JSON.new()

		# Check if there is any error while parsing the JSON string, skip in case of failure
	var parse_result = json.parse(json_string)
	if not parse_result == OK:
		print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
		return

	data = json.get_data()
	json.parse(json_settings_string)
	if not parse_result == OK:
		print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
		return
	settings = json.get_data()
	for achivement in achivements:
		var value = data
		for key in achivement["reference"]:
			if not value.has(key):
				break
			value = value[key]
		if (typeof(value) == TYPE_FLOAT or typeof(value) == TYPE_INT) and not achivement["reached"] and value >= achivement["goal"]:
			achivement["reached"] = true
		
	

