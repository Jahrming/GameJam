extends Node2D

func _ready():
	var video_player = $VideoStreamPlayer
	if video_player == null:
		print("Error: El nodo VideoPlayer no se encontró. Verifica la jerarquía y el nombre del nodo.")
		return
	print("¡Nodo VideoPlayer encontrado! Reproduciendo el video...")
	video_player.play()

func _on_VideoPlayer_finished():
	print("¡Transición terminada! Cargando el primer nivel...")
	get_tree().change_scene_to_file("res://scenes/Level1.tscn")
