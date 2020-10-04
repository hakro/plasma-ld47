extends KinematicBody2D

var direction := Vector2()
var speed := 12.0
var collision_info

func _process(delta):
	collision_info = move_and_collide(direction * speed * delta)
	if collision_info:
		direction = direction.bounce(collision_info.normal)
	rotate(2 * delta)

func die():
	queue_free()
