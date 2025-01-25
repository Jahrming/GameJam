extends Node2D

func _ready():
	print("¡La escena Animation se ha cargado correctamente!")
	$VideoStreamPlayer.play()

func _on_VideoStreamPlayer_finished():
	print("¡El video ha terminado! Cambiando a MainMenu...")
	get_tree().change_scene_to_file("res://scenes/Level1.tscn")

func _process(_delta):
	if not $VideoStreamPlayer.is_playing():
		print("El video terminó, cambiando a MainMenu (método alternativo).")
		get_tree().change_scene_to_file("res://scenes/Level1.tscn")
