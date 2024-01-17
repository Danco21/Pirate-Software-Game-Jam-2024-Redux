extends Node2D
# get collision node, but only when node tree is ready
@onready var collision = $EnemyRadius/EnemyRadiusCollision
# check variables
var enterValue
var check
# starting enemy detection and origin circle
var radius_size = 10
var radius_origin = 10

const GROWTH_RATE = 20

# draw sprite for detection circle and origin circle
func _draw()->void:
	draw_circle(Vector2(0,0), radius_size, Color.AQUA)
	draw_circle(Vector2(0,0), radius_origin, Color.RED)

# starting radius value of the collision circle
#func _ready():
	#pass
	#collision.shape.radius = 10

func _process(delta):
	# grow radius of shape drawn on screen
	radius_size += delta * GROWTH_RATE
	# grow radius of collision 
	collision.shape.radius += delta * GROWTH_RATE
	queue_redraw()

# test for player sprite entering enemy detection area
func _on_enemy_radius_body_entered(body):
	print("player sprite entered enemy radius")
	print("node collision radius=", collision.shape.radius)
	print("drawn shape radius=",radius_size)
	check = true

# test for player sprite leaving enemy detection area
func _on_enemy_radius_body_exited(body):
	check = false
	print("exited")
