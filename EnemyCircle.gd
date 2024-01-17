extends Node2D
# get collision node, but only when node tree is ready
@onready var collision = $EnemyRadius/EnemyRadiusCollision
# check variables
var enterValue
var check
# starting enemy detection and origin circle
var radius_size = 10
var radius_origin = 10

const GROWTH_RATE = 10

# draw sprite for detection circle and origin circle
func _draw()->void:
	draw_circle(Vector2(0,0), radius_size, Color.BLACK)
	draw_circle(Vector2(0,0), radius_origin, Color.RED)

# starting radius value of the collision circle
func _ready():
	collision.shape.radius = 10

func _process(delta):
	# grow shape radius, then refresh the shape drawn on screen
	radius_size += delta * GROWTH_RATE
	queue_redraw()
	
	# grow node collision by time elapsed * 10
	collision.shape.radius += delta * GROWTH_RATE

# test for player sprite entering enemy detection area
func _on_enemy_radius_body_entered(body):
	print(body, " has entered Signal Range")
	check = true

# test for player sprite leaving enemy detection area
func _on_enemy_radius_body_exited(body):
	check = false
	print(body, " has exited Signal Range")

# test for player sprite reaching origin point
func _on_enemy_origin_radius_body_entered(body):
	print(body, " has entered Signal Origin")
