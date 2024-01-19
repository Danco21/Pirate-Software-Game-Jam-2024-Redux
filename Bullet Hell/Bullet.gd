extends Node2D

#Bullet speed 
const SPEED = 100;

func _process(delta):
	position += transform.x * SPEED * delta

#This will kill the bullet as KillTimer node hits 0
func _on_kill_timer_timeout():
	queue_free()

#Kills the bullet when it hits the player
func _on_area_2d_body_entered(body):
	queue_free()
