extends Node2D

onready var inner_circle : Sprite = $InnerCircle
onready var outer_cicrle : Sprite = $OuterCircle

const max_loot := 2
const loot_scene : PackedScene = preload("res://Scenes/Loot.tscn")

func _process(delta):
	inner_circle.rotate(delta * 2)
	outer_cicrle.rotate(- delta * 1)

# Spawn loot
func _on_LootTimer_timeout():
	if get_tree().get_nodes_in_group("loot").size() < max_loot:
		var loot : Area2D = loot_scene.instance()
		var rand_x = (randf() - 0.5) * 35
		var rand_y = (randf() - 0.5) * 35
		loot.position = position + Vector2(rand_x, rand_y)
		get_tree().current_scene.add_child(loot)

