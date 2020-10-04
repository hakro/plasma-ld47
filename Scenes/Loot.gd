extends Area2D

func _on_Loot_body_entered(body):
	queue_free()
