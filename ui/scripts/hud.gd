extends Control


func setMaxHealth(health:int):
	$health.setMaxHealth(health)
	
	
	
func damageTaken(health:int, enemy:String):
	setHealth(health)
	touchedEnemy(enemy, health)
	
func setHealth(health:int):
	$health.setHealth(health)

func gamestared(mode:String):
	$Achivements.gameStared(mode)
	
func addScore(score:int):
	$Score.addScore(score)

func setScore(score:int):
	$Score.setScore(score)

func enemyDeath(score: int, enemy: String):
	setScore(score)
	addEnemyDeath(enemy)
	
func addEnemyDeath(enemy: String):
	$Achivements.enemyKilled(enemy)
	
func gameWon(mode: String):
	$Achivements.gameWon(mode)
	get_tree().change_scene_to_file("res://win.tscn")

func gameLost(mode: String):
	$Achivements.gameLost(mode)
	
	
func death(enemy: String):
	$Achivements.death(enemy)
	get_tree().change_scene_to_file("res://loss.tscn")
	
func touchedEnemy(enemy: String, health:int):
	$Achivements.touchedEnemy(enemy, health)
	
func _input(ev):
	if Input.is_key_pressed(KEY_K):
		addEnemyDeath("bannane")
	elif  Input.is_key_pressed(KEY_T):
		gameLost("default")
	elif Input.is_key_pressed(KEY_O):
		$Achivements.displayAchivment({
		"name":"The Cake is a Lie",
		"texture": preload("res://assets/enemies/cake.png"), 
		"reference":["enemies","damageTaken","cake"], 
		"goal":1, 
		"reached": false
		}
		)
	elif Input.is_key_pressed(KEY_R):
		$Achivements.resetSave()
		
