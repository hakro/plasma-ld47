extends Area2D

func _on_Loot_body_entered(body):
	GameState.add_ammunition()
	queue_free()
