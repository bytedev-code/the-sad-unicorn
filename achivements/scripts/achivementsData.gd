extends Resource

var achivements = [
	{
		"name":"The Cake is a Lie",
		"texture": preload("res://assets/enemies/cake.png"), 
		"reference":["enemies","damageTaken","cake"], 
		"goal":1, 
		"reached": false
	},
	{	
		"name": "Make the Unicorn Laugh",
		"texture": preload("res://assets/enemies/unicorn_happy.png"), 
		"reference":["game","completed", "default"], 
		"goal":1, 
		"reached": false
	},
	{
		"name": "It`s slippery", 
		"texture": preload("res://assets/enemies/banana.png"), 
		"reference":["enemies","killed","bannane"], 
		"goal":10, 
		"reached": false
	},
	{
		"name": "Palim Palim",
		"texture": preload("res://assets/enemies/french_fries_bottle_300x300.png"), 
		"reference":["enemies","fries"], 
		"goal":1, 
		"reached": false
	},
	{
		"name": "It`s slippery", 
		"texture": preload("res://assets/enemies/clock.png"),
		"reference":["enemies","banana"], 
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
	}]
