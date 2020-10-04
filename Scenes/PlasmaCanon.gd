extends KinematicBody2D

onready var shuttle : Sprite = $Sprite
onready var canon_position : Position2D = $Sprite/CanonPosition

const astronaut_scene : PackedScene = preload("res://Scenes/Astronaut.tscn")
const bullet_scene : PackedScene = preload("res://Scenes/Bullet.tscn")
var rotation_speed : float = 2.7

func _process(delta):
	if Input.is_action_pressed("move_right"):
		rotate(delta * rotation_speed)
	if Input.is_action_pressed("move_left"):
		rotate(delta * rotation_speed * -1)

func _input(event):
	if event.is_action_pressed("launch_astronaut"):
		launch_astronaut()
	if event.is_action_pressed("shoot"):
		shoot()

func shoot():
	if GameState.ammunitions <= 0:
		return
	var bullet = bullet_scene.instance()
	bullet.position = canon_position.global_position
	bullet.rotation = rotation
	bullet.direction = (canon_position.global_position - global_position).normalized()
	get_tree().current_scene.add_child(bullet)
	GameState.remove_ammunition()
	

func launch_astronaut():
	if GameState.available_astronauts <= 0:
		return
	var astro = astronaut_scene.instance()
	astro.position = shuttle.global_position
	astro.direction = (global_position - shuttle.global_position).normalized()
	get_tree().current_scene.add_child(astro)
	GameState.remove_astronaut()
