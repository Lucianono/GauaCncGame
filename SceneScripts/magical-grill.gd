extends StaticBody2D

signal player_cooking(dish_name)

var dish_created

func _ready():
	pass

#when grill entered
func _on_Area2D_area_entered(area):
	if(area.get_name() == "caldo-area") && GlobalVar.player_holding != []:
		
		match GlobalVar.player_holding :
			["squid"]:
				dish_created = "Adobo"
			["wheat"]:
				dish_created = "Pandesal"
			["egg"]:
				dish_created = "Balot"
			["pork"]:
				dish_created = "Betamax"
			["pork","wheat"], ["wheat","pork"]:
				dish_created = "MeatBalls"
			["pork","squid"], ["squid","pork"]:
				dish_created = "Relleno"
			["pork","egg"], ["egg","pork"]:
				dish_created = "Sisig"
			["squid","wheat"], ["wheat","squid"]:
				dish_created = "SquidBalls"
			["egg","wheat"], ["wheat","egg"]:
				dish_created = "Tokneneng"
			["egg","squid"], ["squid","egg"]:
				dish_created = "Calamares"
				
		emit_signal("player_cooking",dish_created)
		
