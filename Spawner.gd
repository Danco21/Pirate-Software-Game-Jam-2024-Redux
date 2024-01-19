extends Node2D
@onready var distanceToEnemy = $"../PlayerCharacter/DistancetoCenter"
@onready var player := $"../PlayerCharacter"
@onready var enemy = preload("res://enemy.tscn")
@export var enemyNum = 5

var cloestSignalinstance = 0
var cloestSignalvalue = []
var num = 0



# Called when the node enters the scene tree for the first time.
func _ready():
	cloestSignalvalue.resize(enemyNum)
	cloestSignalvalue.fill(9999)
	for i in enemyNum:
		var enemyInstance = enemy.instantiate()
		enemyInstance.growthrate = randi_range(25, 50)
		enemyInstance.position.x = randi_range(-1000,1000)
		enemyInstance.position.y = randi_range(-1000,1000)
		add_child(enemyInstance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_instance_valid(get_child(num)):
		if get_child(num).check:
			cloestSignalvalue[num] = get_child(num).position.distance_to(player.position)
			cloestSignalinstance = get_child(cloestSignalvalue.find(cloestSignalvalue.min(), 0))
			print(cloestSignalvalue.find(cloestSignalvalue.min(), 0))
			print(cloestSignalvalue)
		else:
			cloestSignalvalue[num] = 9999
	if is_instance_valid(cloestSignalinstance):
		distanceToEnemy.value = map(100*(cloestSignalinstance.position.distance_to(player.position)/cloestSignalinstance.radius_size), 100, 0, 0, 100)
	else:
		distanceToEnemy.value = 0
		
	if is_instance_valid(get_child(num)):
		if get_child(num).killmyself:
			cloestSignalvalue.resize(get_child_count() - 1)
			cloestSignalvalue.fill(9999)
			get_child(num).queue_free()
		
	
	if (get_child_count() > 0):
		num += 1
		if num > (get_child_count() - 1):
			num = 0
	else:
		queue_free()
	

# helper function that reverses proximity counter (0 to 100 as player gets closer to target)
func map(value, fl, fh, tl, th):
	return ((value - fl)*(th-tl)/(fh-fl)+tl)
