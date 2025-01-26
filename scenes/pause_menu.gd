extends Control

@onready var main = $"../.."
# Reanudar el juego
func _on_atras_pressed():
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")  # Cambia a la escena del menú principal
	Engine.time_scale = 1
	
	
func _on_reanudar_pressed():
	main.pauseMenu()
	
	

func _on_reiniciar_pressed():
	get_tree().change_scene_to_file("res://scenes/Level1.tscn")
	Engine.time_scale = 1
