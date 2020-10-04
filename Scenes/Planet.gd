extends Node2D

onready var inner_circle : Sprite = $InnerCircle
onready var outer_cicrle : Sprite = $OuterCircle

const max_loot := 2
const loot_scene : PackedScene = preload("res://Scenes/Loot.tscn")

var health := 100

func _process(delta):
	inner_circle.rotate(delta * 0.1)
	outer_cicrle.rotate(- delta * 0.2)

# Spawn loot
func _on_LootTimer_timeout():
	if get_tree().get_nodes_in_group("loot").size() < max_loot:
		var loot : Area2D = loot_scene.instance()
		var rand_x = (randf() - 0.5) * 35
		var rand_y = (randf() - 0.5) * 35
		loot.position = position + Vector2(rand_x, rand_y)
		get_tree().current_scene.add_child(loot)

func take_damage(damage: int):
	health -= damage
	# Make it smaller
	inner_circle.scale *= 0.97

func _on_HitArea_area_entered(area : Area2D):
	take_damage(10)
	area.die()
