extends Node2D
@onready var distanceToEnemy = $DistancetoCenter
@onready var player := $PlayerCharacter
@onready var enemy = preload("res://enemy.tscn")
@export var enemyNum = 5

var biggestRadiusInRange = 0
var num = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in enemyNum:
		var enemyInstance = enemy.instantiate()
		enemyInstance.growthrate = randi_range(1, 50)
		enemyInstance.position.x = randi_range(-1000,1000)
		enemyInstance.position.y = randi_range(-1000,1000)
		add_child(enemyInstance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (get_child(num).check == true) && (get_child(num).radius_size > biggestRadiusInRange.radius_size):
		biggestRadiusInRange = get_child(num)
		
	if (num < (get_child_count() - 1)):
		num+=1
	if is_instance_valid(biggestRadiusInRange):
		distanceToEnemy.value = map(100*(biggestRadiusInRange.position.distance_to(player.position)/biggestRadiusInRange.radius_size), 100, 0, 0, 100)

# helper function that reverses proximity counter (0 to 100 as player gets closer to target)
func map(value, fl, fh, tl, th):
	return ((value - fl)*(th-tl)/(fh-fl)+tl)
