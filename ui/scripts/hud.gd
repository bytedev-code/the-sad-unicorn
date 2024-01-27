extends Control


func setMaxHealth(health:int):
	$health.setMaxHealth(health)
		
func setHealth(health:int):
	$health.setHealth(health)
	
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

func gameLost(mode: String):
	$Achivements.gameLost(mode)
	
func death(enemy: String):
	$Achivements.death(enemy)
	
func touchedEnemy(enemy: String):
	$Achivements.touchedEnemy(enemy)
	
