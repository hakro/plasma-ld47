extends Area2D

const SPEED := 180
var direction := Vector2()

func _process(delta):
	position += direction * SPEED * delta

func _on_Bullet_area_entered(enemy : Area2D):
	GameState.add_score()
	enemy.die()
	queue_free()
