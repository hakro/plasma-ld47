extends Control

onready var help_panel = $HelpPanel
onready var loot_sound = AudioManager.get_node("Loot")

func _on_Help_pressed():
	loot_sound.play()
	help_panel.show()

func _on_Quit_pressed():
	get_tree().quit()

func _on_BackToMenu_pressed():
	loot_sound.play()
	help_panel.hide()

func _on_Play_pressed():
	loot_sound.play()
	GameState.reset_game()
	get_tree().change_scene("res://Scenes/World.tscn")
