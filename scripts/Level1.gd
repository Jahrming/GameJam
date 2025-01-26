extends Node2D

# Variables exportadas para configurar desde el editor
@export var spawn_interval := 1.0  # Tiempo entre generación de obstáculos
@export var obstacle_speed := 200.0  # Velocidad de caída de los obstáculos
@onready var timer_hud = $TimerHUD  # Referencia al TimerHUD

# Variables internas
var meta_activated := false  # Indica si la meta está activa

func _ready():
	# Iniciar el generador de obstáculos infinito
	print("Generación de obstáculos infinita iniciada.")
	$Spawner.start_spawning_infinite()

	# Iniciar el temporizador en cuenta regresiva
	timer_hud.start_countdown(200)  # Inicia la cuenta regresiva desde 200 segundos
	timer_hud.connect("timer_finished", Callable(self, "_on_timer_finished"))

func _on_timer_finished() -> void:
	# Manejar el evento cuando el tiempo llegue a 0
	print("¡El tiempo se acabó! Fin del nivel.")
	on_player_touched_obstacle()  # Reutilizamos la lógica para terminar el nivel

func on_player_touched_obstacle() -> void:
	# Pausar el temporizador
	timer_hud.pause_timer()
	
	# Guardar el tiempo en Global
	Global.last_play_time = timer_hud.get_elapsed_time()

	# Cambiar a la escena Game Over
	get_tree().change_scene("res://scenes/GameOver.tscn")
