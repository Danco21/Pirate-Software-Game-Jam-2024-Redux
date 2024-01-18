extends Node2D

@onready var originCollision =$OriginArea/OriginCollision
var radius_origin = 10

func _draw()->void:
	draw_circle(Vector2(0,0), radius_origin, Color.RED)

# Called when the node enters the scene tree for the first time.
func _ready():
	originCollision.shape.radius = 10


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _on_origin_area_body_entered(body):
	print(body, " has entered Signal Origin")


func _on_origin_area_body_exited(body):
	print(body, " has exited Signal Origin")
