extends Node2D

#get nodes when node tree is ready, assign to variables
@onready var enemy := $Enemy
@onready var player := $PlayerCharacter
@onready var distanceToEnemy = $DistancetoCenter


# every frame, see if check value in enemy detection area has been triggered
# update distance value to reflect proximity
func _process(delta):
	if enemy.check:
		#Note this will only display for the first enemy only
		distanceToEnemy.value = map(100*(enemy.position.distance_to(player.position)/enemy.radius_size), 100, 0, 0, 100)
	else:
		distanceToEnemy.value = 0

# helper function that reverses proximity counter (0 to 100 as player gets closer to target)
func map(value, fl, fh, tl, th):
	return ((value - fl)*(th-tl)/(fh-fl)+tl)
