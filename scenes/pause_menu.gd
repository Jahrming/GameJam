extends Control

@onready var main =  $"../../"




func _on_reiniciar_pressed():
	get_tree().change_scene_to_file("res://scenes/Level1.tscn")


func _on_reanudar_pressed():
	main.pauseMenu()


func _on_atras_pressed():
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
