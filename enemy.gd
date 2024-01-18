extends Node2D

@onready var expand := $EnemyCircle
@onready var center := $EnemyOrigin


# Called when the node enters the scene tree for the first time.
func _ready():
	center.position.x = expand.position.x
	center.position.y = center.position.y
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
