extends Control

@onready var main = $".."


func _on_return_pressed():
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
	Engine.time_scale = 1

func _on_pause_pressed():
	main.pauseMenu()
	
