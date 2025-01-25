extends Node2D

# Variables exportadas para configurar desde el editor
@export var spawn_interval := 1.0  # Tiempo entre generación de obstáculos
@export var obstacle_speed := 200.0  # Velocidad de caída de los obstáculos
@export var num_obstacles_min := 5  # Número mínimo de obstáculos
@export var num_obstacles_max := 10  # Número máximo de obstáculos

# Variables internas
var obstacles_spawned := 0  # Contador de obstáculos generados
var total_obstacles := 0  # Total de obstáculos a generar
var meta_activated := false  # Indica si la meta está activa

func _ready():
	# Calcular el número de obstáculos a generar
	total_obstacles = randi_range(num_obstacles_min, num_obstacles_max)
	print("Se generarán %s obstáculos." % total_obstacles)

	# Llamar a Spawner para iniciar la generación de obstáculos
	$Spawner.start_spawning(total_obstacles)

	# Desactivar la colisión de la meta al inicio


func activate_goal():
	# Activa la meta al terminar la generación de obstáculos
	meta_activated = true
	$Goal.set_meta_active(true)
	print("¡Meta activada!")

func on_player_reaches_goal():
	# Verificar si el jugador puede completar el nivel
	if meta_activated:
		print("¡Nivel completado! Cambiando al siguiente nivel...")
		get_tree().change_scene("res://scenes/Level2.tscn")
	else:
		print("La meta aún no está activa.")
		
#codigo pausa
@onready var pause_menu = $Camera2D/PauseMenu
var paused = false

func _process(_delta):  # Cambiamos "delta" por "_delta"
	if Input.is_action_just_pressed("pause"):
		pauseMenu()

func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	
	paused = !paused

