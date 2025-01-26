extends Node

@export var music_stream: AudioStream = null  # Archivo de música predeterminado (opcional)
@onready var music_player: AudioStreamPlayer = AudioStreamPlayer.new()  # Nodo para reproducir música

func _ready():
	# Añadir el AudioStreamPlayer al nodo
	add_child(music_player)

	# Configurar el AudioStreamPlayer
	if music_stream:
		music_player.stream = music_stream
		music_player.loop = true  # Reproducir en bucle
		music_player.play()

func play_music(stream: AudioStream) -> void:
	# Cambiar la música si es diferente
	if music_player.stream != stream:
		music_player.stop()
		music_player.stream = stream
		music_player.play()

func stop_music() -> void:
	# Detener la música
	music_player.stop()
