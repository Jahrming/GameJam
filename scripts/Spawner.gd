extends Node2D

@export var spawn_interval_min: float = 1.0  # Tiempo mínimo entre spawns
@export var spawn_interval_max: float = 2.0  # Tiempo máximo entre spawns
@export var total_obstacles: int = 40  # Número total de obstáculos
@export var obstacle_scene: PackedScene  # Escena del obstáculo (se asigna en el Inspector)

var obstacles_generated: int = 0  # Contador de obstáculos generados
var level_ending := false  # Controla si el nivel está terminando

func start_spawning(total_obstacles: int) -> void:
	self.total_obstacles = total_obstacles
	generate_obstacles()

# Genera todos los obstáculos, uno por uno
func generate_obstacles() -> void:
	for i in range(total_obstacles):
		spawn_obstacle()

		# Espera un intervalo aleatorio antes de generar el siguiente obstáculo
		var spawn_interval = randf_range(spawn_interval_min, spawn_interval_max)
		await get_tree().create_timer(spawn_interval).timeout

	print("Se generaron todos los obstáculos.")
	end_level()

# Lógica para instanciar un obstáculo
func spawn_obstacle() -> void:
	if obstacle_scene == null:
		print("Error: No se configuró una escena de obstáculo.")
		return
	# Instanciar el obstáculo desde la escena
	var obstacle = obstacle_scene.instantiate()
	# Configurar la posición inicial más alta en el eje Y
	obstacle.position = Vector2(randf_range(-450, 150), -250)
	# Añadir el obstáculo como hijo de Spawner
	add_child(obstacle)
	# Incrementar el contador de obstáculos generados
	obstacles_generated += 1
	print("Obstáculo #%d generado en posición: %s" % [obstacles_generated, obstacle.position])

# Termina el nivel después de 3 segundos
func end_level() -> void:
	if level_ending:
		return  # Evita múltiples llamadas
	level_ending = true

	print("Esperando 3 segundos antes de cambiar de nivel...")
	await get_tree().create_timer(3.0).timeout  # Esperar 3 segundos
	print("Pasas al siguiente nivel...")
	get_tree().change_scene_to_file("res://scenes/Proximamente.tscn")
