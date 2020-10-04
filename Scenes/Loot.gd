extends Area2D

onready var loot_sound = AudioManager.get_node("Loot")

func _on_Loot_body_entered(body):
	GameState.add_ammunition()
	loot_sound.play()
	queue_free()
