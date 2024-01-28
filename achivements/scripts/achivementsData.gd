extends Resource

var achivements = [
	{	
		"name": "Make the Unicorn Laugh",
		"texture": preload("res://assets/enemies/unicorn_happy.png"), 
		"reference":["game","completed", "default"], 
		"goal":1, 
		"reached": false
	},
	{	
		"name": "Best buddies",
		"texture": preload("res://assets/enemies/unicorn_happy.png"), 
		"reference":["game","completed", "default"], 
		"goal":10, 
		"reached": false
	},
	{
		"name": "It`s slippery", 
		"texture": preload("res://assets/enemies/banana.png"), 
		"reference":["enemies","killed","banana"], 
		"goal":10, 
		"reached": false
	},
	{
		"name": "pizza service!", 
		"texture": preload("res://assets/enemies/pizza.png"), 
		"reference":["enemies","killed","pizza"], 
		"goal":1, 
		"reached": false
	},
	{
		"name": "Such a bad actor", 
		"texture": preload("res://assets/enemies/pizza.png"), 
		"reference":["enemies","killed","pizza"], 
		"goal":10, 
		"reached": false
	},
	{
		"name": "Zoo time", 
		"texture": preload("res://assets/enemies/monkey.png"), 
		"reference":["enemies","killed","monkey"], 
		"goal":1, 
		"reached": false
	},
	{
		"name": "Harambe?", 
		"texture": preload("res://assets/enemies/monkey.png"), 
		"reference":["enemies","killed","monkey"], 
		"goal":10, 
		"reached": false
	},
	{
		"name": "Don't let them Sting", 
		"texture": preload("res://assets/enemies/bee_queen.png"), 
		"reference":["enemies","killed","bee_queen"], 
		"goal":1, 
		"reached": false
	},
	{
		"name": "Beez Nutz", 
		"texture": preload("res://assets/enemies/bee_queen.png"), 
		"reference":["enemies","killed","bee_queen"], 
		"goal":10, 
		"reached": false
	},
	{
		"name": "YES", 
		"texture": preload("res://assets/enemies/cookie.png"), 
		"reference":["enemies","killed","cookie"], 
		"goal":1, 
		"reached": false
	},
	{
		"name": "He needs some milk", 
		"texture": preload("res://assets/enemies/cookie.png"), 
		"reference":["enemies","killed","cookie"], 
		"goal":10, 
		"reached": false
	},
	{
		"name": "Catwoman", 
		"texture": preload("res://assets/enemies/cat_woman.png"), 
		"reference":["enemies","killed","cat_woman"], 
		"goal":1, 
		"reached": false
	},
	{
		"name": "We are just super Friends", 
		"texture": preload("res://assets/enemies/cat_woman.png"), 
		"reference":["enemies","killed","cat_woman"], 
		"goal":10, 
		"reached": false
	},
	{
		"name": "Those days", 
		"texture": preload("res://assets/enemies/cloud .png"), 
		"reference":["enemies","killed","cloud"], 
		"goal":1, 
		"reached": false
	},
	{
		"name": "Dev Ops Time", 
		"texture": preload("res://assets/enemies/cloud .png"), 
		"reference":["enemies","killed","cloud"], 
		"goal":10, 
		"reached": false
	},
	{
		"name": "Funny business", 
		"texture": preload("res://assets/enemies/clown_300x300.png"), 
		"reference":["enemies","killed","clown"], 
		"goal":1, 
		"reached": false
	},
	{
		"name": "IT", 
		"texture": preload("res://assets/enemies/clown_300x300.png"), 
		"reference":["enemies","killed","clown"], 
		"goal":10, 
		"reached": false
	},
	{
		"name": "Palim Palim",
		"texture": preload("res://assets/enemies/french_fries_bottle_300x300.png"), 
		"reference":["enemies","killed","french_fries_bootle"], 
		"goal":1, 
		"reached": false
	},
	{
		"name": "rather a samll one",
		"texture": preload("res://assets/enemies/french_fries_bottle_300x300.png"), 
		"reference":["enemies","killed","french_fries_bootle"], 
		"goal":10, 
		"reached": false
	},
	{
		"name": "Try harder next Time",
		"texture": preload("res://assets/enemies/clock.png"),
		"reference":["game","lost","total"], 
		"goal":1, 
		"reached": false
	},
	{
		"name": "Shoot = Space!!", 
		"texture": preload("res://assets/enemies/clock.png"),
		"reference":["goals","los"], 
		"goal":10, "reached": false
	},
	{
		"name": "Are you even trying???", 
		"texture": preload("res://assets/enemies/clock.png"),
		"reference":["goals","los"], 
		"goal":20, "reached": false
	},
	{
		"name":"The Cake is a Lie",
		"texture": preload("res://assets/enemies/cake.png"), 
		"reference":["enemies","damageTaken","cake"], 
		"goal":1, 
		"reached": false
	},
	{
		"name":"1.21GW",
		"texture": preload("res://assets/enemies/lightning.png"), 
		"reference":["enemies","damageTaken","lightning"], 
		"goal":5, 
		"reached": false
	},
	{
		"name":"How many do fit inside",
		"texture": preload("res://assets/enemies/clowns_car.png"), 
		"reference":["enemies","killed","clown_car"], 
		"goal":5, 
		"reached": false
	},
	{
		"name":"Dough is overrated",
		"texture": preload("res://assets/enemies/chocolate_bar.png"), 
		"reference":["enemies","killed","chocolate"], 
		"goal":5, 
		"reached": false
	},
	{
		"name":"Will use them...",
		"texture": preload("res://assets/enemies/banana.png"), 
		"reference":["enemies","killed_by","banana"], 
		"goal":5, 
		"reached": false
	},
	{
		"name":"Sticky situation",
		"texture": preload("res://assets/enemies/honey_pot.png"), 
		"reference":["enemies","killed_by","honey"], 
		"goal":1, 
		"reached": false
	},
	{
		"name":"Rumbly in my tumbly",
		"texture": preload("res://assets/enemies/honey_pot.png"), 
		"reference":["enemies","killed_by","honey"], 
		"goal":5, 
		"reached": false
	},
	{
		"name":"Drowning in fluf",
		"texture": preload("res://assets/enemies/slepping_cat.png"), 
		"reference":["enemies","killed_by","cat"], 
		"goal":5, 
		"reached": false
	},
	{
		"name":"So close but so far",
		"texture": preload("res://assets/enemies/unicorn_sad.png"), 
		"reference":["enemies","killed_by","unicorn"], 
		"goal":1, 
		"reached": false
	},
	{
		"name":"Mortal enemy",
		"texture": preload("res://assets/enemies/unicorn_evil.png"), 
		"reference":["enemies","killed_by","unicorn"], 
		"goal":5, 
		"reached": false
	},
	{
		"name":"What a start",
		"texture": preload("res://assets/enemies/book.png"), 
		"reference":["game","bestscore"], 
		"goal":250, 
		"reached": false
	},
	{
		"name":"Terminator",
		"texture": preload("res://assets/enemies/book.png"), 
		"reference":["enemies","killed","total"], 
		"goal":25, 
		"reached": false
	}
	]
