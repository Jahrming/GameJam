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
	timer_hud.start_countdown(120)  # Inicia la cuenta regresiva desde 200 segundos
	timer_hud.connect("timer_finished", Callable(self, "_on_timer_finished"))

func _on_timer_finished() -> void:
	# Manejar el evento cuando el tiempo llegue a 0
	print("¡El tiempo se acabó! Cambiando a la escena Proximamente.tscn.")
	get_tree().change_scene_to_file("res://scenes/Proximamente.tscn")  # Cambiar a la escena Proximamente.tscn

func on_player_touched_obstacle() -> void:
	# Pausar el temporizador
	timer_hud.pause_timer()
	
	# Cambiar a la escena GameOver
	print("¡Jugador tocado por un obstáculo! Cambiando a la escena GameOver.")
	get_tree().change_scene("res://scenes/GameOver.tscn")

# Código de pausa
@onready var pause_menu = $Camera2D/PauseMenu
var paused = false

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pause_menu_toggle()

func pause_menu_toggle():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	
	paused = !paused

