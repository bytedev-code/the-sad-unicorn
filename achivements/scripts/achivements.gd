extends Control 

var save:SaveData = SaveData.new()
var achivementBanner = preload("res://achivements/achivementBanner.tscn")

func resetSave():
	save.resetGame()
	
func gameStared(mode: String):
	if(save.data["game"]["started"].has(mode)):
		save.data["game"]["started"][mode] += 1
	else:
		save.data["game"]["started"][mode] = 1
	save.data["game"]["started"]["total"] += 1
	checkforAchivement()
	save.saveGame()
	
func gameWon(mode: String)	:
	if(save.data["game"]["completed"].has(mode)):
		save.data["game"]["completed"][mode] += 1
	else:
		save.data["game"]["completed"][mode] = 1
	save.data["game"]["completed"]["total"] += 1
	checkforAchivement()
	save.saveGame()

func gameLost(mode: String):
	if(save.data["game"]["lost"].has(mode)):
		save.data["game"]["lost"][mode] += 1
	else:
		save.data["game"]["lost"][mode] = 1
	save.data["game"]["lost"]["total"] += 1
	checkforAchivement()
	save.saveGame()
	
func death(enemy: String):
	if(save.data["enemies"]["killed_by"].has(enemy)):
		save.data["enemies"]["killed_by"][enemy] += 1
	else:
		save.data["enemies"]["killed_by"][enemy] = 1
	checkforAchivement()
	save.saveGame()
	
func touchedEnemy(enemy: String):
	if(save.data["enemies"]["damageTaken"].has(enemy)):
		save.data["enemies"]["damageTaken"][enemy] += 1
	else:
		save.data["enemies"]["damageTaken"][enemy] = 1
	checkforAchivement()
	save.saveGame()
	
func enemyKilled(enemy:String):
	if(save.data["enemies"]["killed"].has(enemy)):
		save.data["enemies"]["killed"][enemy] += 1
	else:
		save.data["enemies"]["killed"][enemy] = 1
	save.data["enemies"]["killed"]["total"] += 1
	checkforAchivement()
	save.saveGame()
	
func goalreched(goalType:String):
	if(save.data["goals"]["completd"].has(goalType)):
		save.data["goals"]["completd"][goalType] += 1
	else:
		save.data["goals"]["completd"][goalType] = 1
	checkforAchivement()
	save.saveGame()
	
	
func checkforAchivement():
	for achivement in save.achivements:
		var value = save.data
		for key in achivement["reference"]:
			if not value.has(key):
				break
			value = value[key]
		if (typeof(value) == TYPE_FLOAT or typeof(value) == TYPE_INT) and not achivement["reached"] and value >= achivement["goal"]:
			achivement["reached"] = true
			displayAchivment(achivement)
			
var banners = []
var tween
func displayAchivment(achivment):
	var banner = achivementBanner.instantiate()
	banner.custom_minimum_size.y = 50
	banner.setAchivement(achivment)
	banners.append(banner)
	if tween:
		tween.kill()
	tween = create_tween()
	$BannerContainer.add_child(banner)
	$BannerContainer.move_child(banner, 0)
	$BannerContainer.position.y = -50
	tween.tween_property($BannerContainer, "position:y", 4, 0.5).set_ease(Tween.EASE_OUT)

