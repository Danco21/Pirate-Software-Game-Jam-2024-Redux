extends Node2D

#get nodes when node tree is ready, assign to variables
@onready var origin := $EnemyCircle
@onready var player := $PlayerCharacter
@onready var distanceToEnemy = $DistancetoCenter

# every frame, see if check value in enemy detection area has been triggered
# update distance value to reflect proximity
func _process(delta):
	if origin.check == true:
		distanceToEnemy.value = map(100*(origin.position.distance_to(player.position)/origin.radius_size), 100, 0, 0, 100)
	else:
		distanceToEnemy.value = 0

# helper function that reverses proximity counter (0 to 100 as player gets closer to target)
func map(value, fl, fh, tl, th):
	return ((value - fl)*(th-tl)/(fh-fl)+tl)
