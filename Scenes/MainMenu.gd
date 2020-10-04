extends Control

onready var help_panel = $HelpPanel

func _on_Help_pressed():
	help_panel.show()

func _on_Quit_pressed():
	get_tree().quit()

func _on_BackToMenu_pressed():
	help_panel.hide()

func _on_Play_pressed():
	GameState.reset_game()
	get_tree().change_scene("res://Scenes/World.tscn")
