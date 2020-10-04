extends Area2D

const SPEED := 180
var direction := Vector2()

func _process(delta):
	position += direction * SPEED * delta
