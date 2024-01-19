extends CollisionShape2D

@export var collision_size = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	shape.radius = collision_size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	shape.radius = collision_size
