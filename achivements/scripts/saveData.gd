class_name SaveData extends Object

var data = {}
var template = {
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
var achivements = [{"name":"The Cake is a Lie", "reference":["goals","hitBy","cake"], "goal":1, "reached": false},
					{"name": "Make the Unicorn Laugh","texture": preload("res://assets/enemies/banana.png"), "reference":["goals","completed", "normal"], "goal":1, "reached": false},
					{"name": "It`s slippery", "reference":["enemies","banana"], "goal":10, "reached": false},
					{"name": "Palim Palim", "reference":["enemies","fries"], "goal":1, "reached": false},
					{"name": "It`s slippery", "reference":["enemies","banana"], "goal":10, "reached": false},
					{"name": "Try harder next Time", "reference":["goals","los"], "goal":1, "reached": false},
					{"name": "Shoot = Space!!", "reference":["goals","los"], "goal":10, "reached": false},
					{"name": "Are you even trying???", "reference":["goals","los"], "goal":20, "reached": false}]

func _init():
	data = template;
	#Todo 
	#loadGame()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func saveGame():
	var save_game = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	var json_data = JSON.stringify(data)
	save_game.store_line(json_data)
	
func resetGame():
	var dir = DirAccess.open("user://")
	if dir.file_exists("user://savegame.save"):
		dir.remove("user://savegame.save")
	data = template
	saveGame()
	
	
func loadGame():
	if not FileAccess.file_exists("user://savegame.save"):
		return
	var save_game = FileAccess.open("user://savegame.save", FileAccess.READ)
	var json_string = save_game.get_line()

	# Creates the helper class to interact with JSON
	var json = JSON.new()

		# Check if there is any error while parsing the JSON string, skip in case of failure
	var parse_result = json.parse(json_string)
	if not parse_result == OK:
		print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
		return

	data = json.get_data()
	
	for achivement in achivements:
		var value = data
		for key in achivement["reference"]:
			if not value.has(key):
				break
			value = value[key]
		if typeof(value) == TYPE_FLOAT and value >= achivement["goal"]:
			achivement["reached"] = true
		
	

