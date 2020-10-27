extends AnimatedSprite

func _ready():
	var data = GameSaved.load_data()
	
	match data["current_skin"]:
		"vita":
			play("vita_idle")
		
		"tard":
			play("tard_idle")
		
		"mort":
			play("mort_idle")
		
		"doux":
			play("doux_idle")
