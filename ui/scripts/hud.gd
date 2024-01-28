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
		
