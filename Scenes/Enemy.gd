extends Area2D

onready var explosion_anim : AnimatedSprite = $Explosion

var direction := Vector2()
const SPEED := 15

func _ready():
	var screen_center := get_viewport_rect().size / 2
	direction = (screen_center - position).normalized()
	rotation = direction.angle() + PI / 2
	# Randomize explosion rotation for variation
	explosion_anim.rotate(randf())

func _process(delta):
	position += direction * SPEED * delta

func die():
	explosion_anim.show()
	explosion_anim.play("explosion")

func _on_Enemy_body_entered(astronaut : KinematicBody2D):
	astronaut.die()
	die()

func _on_Explosion_animation_finished():
	queue_free()
