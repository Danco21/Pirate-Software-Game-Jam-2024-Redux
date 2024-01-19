extends Node2D

const BULLET_SCENE = preload("res://Bullet Hell/Bullet.tscn")
@onready var shoot_timer = $ShootTimer
@onready var rotater = $Rotater


const ROTATE_SPD = 100 #Obiting speed
const SHOOTER_TIMER_WAIT_TIME = 0.2 #Shoot Cooldown between each shot
const SPAWN_POINT_COUNT = 4 #How many times you want to shoot at the same time
const RADIUS = 100 #How big you want the shot spwan obit
@export var begin_shooting = true #"THEN I STARTED BLASTING"


# Called when the node enters the scene tree for the first time.
func _ready():
	#step value is 90 degrees
	var step = 2 * PI / SPAWN_POINT_COUNT
	
	#Spawns the shot points. 
	#If step = 90 degrees, spawn point = (step * i).
	#At i = 0, spawn point = 0 degrees (step * 0).
	#At i = 1, spawn point = 90 degrees.
	#At i = 2, spawn point = 180 degrees. Etc
	for i in range(SPAWN_POINT_COUNT):
		var spawn_point = Node2D.new()
		var pos = Vector2(RADIUS, 0). rotated(step * i)
		spawn_point.position = pos
		spawn_point.rotation = pos.angle()
		rotater.add_child(spawn_point)
		
	#When to start shooting
	if begin_shooting == true:
		shoot_timer.wait_time = SHOOTER_TIMER_WAIT_TIME
		shoot_timer.start()
	
#Cause the spawn points to orbit.
func _process(_delta):
	var new_rotation = rotater.rotation_degrees + ROTATE_SPD * _delta
	rotater.rotation_degrees = fmod(new_rotation, 360)
	


#Creating the bullets when shoot_timer finishes
func _on_shoot_timer_timeout():
	for s in rotater.get_children():
		var bullet = BULLET_SCENE.instantiate()
		get_tree().root.add_child(bullet)
		bullet.position = s.global_position
		bullet.rotation = s.global_rotation
