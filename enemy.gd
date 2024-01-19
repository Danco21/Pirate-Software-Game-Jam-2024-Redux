extends Node2D
# get collision node, but only when node tree is ready
@onready var collision
@onready var originCollision = $OriginArea/OriginCollision
@onready var check
@export var growthrate = randi_range(1, 50)

# starting enemy detection and origin circle
var radius_size = 10
var radius_origin = 10

# draw sprite for detection circle and origin circle
func _draw()->void:
	draw_circle(Vector2(0,0), radius_size, Color.BLACK)
	draw_circle(Vector2(0,0), radius_origin, Color.RED)

# starting radius value of the collision circle
func _ready():
	var collision = get_node("EnemyRadius/EnemyRadiusCollision")
	collision.shape.radius = 10
	originCollision.shape.radius = 20

func _process(_delta):
	var collision = get_node("EnemyRadius/EnemyRadiusCollision")
	# grow shape radius, then refresh the shape drawn on screen
	radius_size += _delta*growthrate
	queue_redraw()
	
	# grow node collision by time elapsed * 10
	collision.shape.radius = radius_size
	


# test for player sprite entering enemy detection area
func _on_enemy_radius_body_entered(body):
	print(body, " has entered Signal Range: Radius:", radius_size)
	print(body, " has entered Signal Range: COllision", collision.shape.radius)
	check = true

# test for player sprite leaving enemy detection area
func _on_enemy_radius_body_exited(body):
	check = false
	print(body, " has exited Signal Range")

func _on_origin_area_body_entered(body):
	print(body, " has entered Origin Range")

func _on_origin_area_body_exited(body):
	print(body, " has exited Origin Range")
