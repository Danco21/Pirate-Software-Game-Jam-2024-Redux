extends Node2D

@onready var origin := $EnemyCircle
@onready var player := $PlayerCharacter
@onready var distanceToEnemy = $DistancetoCenter

func _process(delta):
	if origin.check == true:
		distanceToEnemy.value = map(100*(origin.position.distance_to(player.position)/origin.radius_size), 100, 0, 0, 100)
	else:
		distanceToEnemy.value = 0

func map(value, fl, fh, tl, th):
	return ((value - fl)*(th-tl)/(fh-fl)+tl)





	

