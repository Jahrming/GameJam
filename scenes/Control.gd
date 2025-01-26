extends Control

@onready var music_player: AudioStreamPlayer = $AudioStreamPlayer  # Reproducción de música de fondo
@onready var button_sound: AudioStreamPlayer = $ButtonSound  # Nodo para el sonido de los botones

func _ready():
	# Reproducir la música al iniciar la escena
	if music_player:
		music_player.play()
	else:
		print("Error: Nodo AudioStreamPlayer (música) no encontrado.")
	
	if not button_sound:
		print("Error: Nodo AudioStreamPlayer (sonido botones) no encontrado.")

# Reproducir el sonido al presionar un botón
func play_button_sound() -> void:
	if button_sound:
		button_sound.play()
	else:
		print("Error: Nodo ButtonSound no encontrado.")

func _exit_tree():
	# Detener la música al salir de la escena
	if music_player:
		music_player.stop()

# Botones y acciones
func _on_jugar_pressed():
	play_button_sound()  # Reproducir sonido
	get_tree().change_scene_to_file("res://scenes/Level1.tscn")

func _on_salir_pressed():
	play_button_sound()  # Reproducir sonido
	get_tree().quit()

func _on_creditos_pressed():
	play_button_sound()  # Reproducir sonido
	get_tree().change_scene_to_file("res://scenes/Creditos.tscn")

func _on_volver_pressed():
	play_button_sound()  # Reproducir sonido
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")

func _on_box_container_pressed():
	play_button_sound()  # Reproducir sonido
	get_tree().change_scene_to_file("res://scenes/Level1.tscn")

