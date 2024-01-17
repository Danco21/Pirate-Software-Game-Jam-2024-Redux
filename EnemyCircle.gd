extends Node2D

@onready var collision = $EnemyRadius/EnemyRadiusCollision
@onready var radius_size = 10
var radius_origin = 10
@onready var enterValue
@onready var check

func _draw()->void:
	draw_circle(Vector2(0,0), radius_size*1, Color.BLACK)
	draw_circle(Vector2(0,0), radius_origin, Color.RED)

# ? initial radius value of the collision space
func _ready():
	collision.shape.radius = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	radius_size += delta*25
	queue_redraw()
	collision.shape.radius += delta*10


func _on_enemy_radius_body_entered(body):
	print(body, " has entered Signal Range")

	check = true
	
func _on_enemy_radius_body_exited(body):
	check = false
	
	print(body, " has exited Signal Range")


func _on_enemy_origin_radius_body_entered(body):
	print(body, " has entered Signal Origin")
	
