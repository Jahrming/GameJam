extends Node2D

@export var spawn_interval_min: float = 2.0  # Intervalo mínimo inicial (en segundos)
@export var spawn_interval_max: float = 3.0  # Intervalo máximo inicial (en segundos)
@export var obstacle_scene: PackedScene  # Escena del obstáculo
@export var acceleration_interval: float = 30.0  # Tiempo (en segundos) entre cada aceleración
@export var min_spawn_interval: float = 0.5  # Límite mínimo para el intervalo de generación

var spawning: bool = false  # Controla si los obstáculos se están generando
var timer_acceleration: Timer  # Timer para manejar la aceleración
var obstacles_generated: int = 0  # Contador de obstáculos generados

func _ready() -> void:
	# Configuramos el temporizador de aceleración
	timer_acceleration = Timer.new()
	timer_acceleration.one_shot = false
	timer_acceleration.wait_time = acceleration_interval
	add_child(timer_acceleration)
	
	# Usamos el nuevo sistema de Callable
	timer_acceleration.connect("timeout", Callable(self, "_accelerate_spawn_rate"))

func start_spawning_infinite() -> void:
	# Inicia la generación infinita
	spawning = true
	timer_acceleration.start()  # Comienza el temporizador de aceleración
	spawn_obstacles_infinite()

func spawn_obstacles_infinite() -> void:
	while spawning:
		spawn_obstacle()

		# Generar un intervalo aleatorio entre `spawn_interval_min` y `spawn_interval_max`
		var spawn_interval = randf_range(spawn_interval_min, spawn_interval_max)

		# Mostrar en consola cuánto tiempo falta para el siguiente obstáculo
		print("Próximo obstáculo en: %.2f segundos" % spawn_interval)
		
		await get_tree().create_timer(spawn_interval).timeout

# Lógica para instanciar un obstáculo
func spawn_obstacle() -> void:
	if obstacle_scene == null:
		print("Error: No se configuró una escena de obstáculo.")
		return

	var obstacle = obstacle_scene.instantiate()
	
	# Configurar la posición inicial dentro del rango especificado
	obstacle.position = Vector2(randf_range(-450, 450), -255)  # Generar en el rango definido

	# Añadir el obstáculo como hijo de Spawner
	add_child(obstacle)

	# Incrementar el contador y mostrar un mensaje en consola
	obstacles_generated += 1
	print("Obstáculo #%d generado en posición: %s" % [obstacles_generated, obstacle.position])

func _accelerate_spawn_rate() -> void:
	# Reduce progresivamente el intervalo de generación
	if spawn_interval_min > min_spawn_interval:
		spawn_interval_min = max(spawn_interval_min / 2, min_spawn_interval)  # Reduce a la mitad o al mínimo
	if spawn_interval_max > min_spawn_interval:
		spawn_interval_max = max(spawn_interval_max / 2, min_spawn_interval)  # Reduce a la mitad o al mínimo
	
	print("Nueva velocidad de generación: [%f, %f]" % [spawn_interval_min, spawn_interval_max])
	
	# Si los intervalos ya están en el mínimo, podemos detener el temporizador de aceleración
	if spawn_interval_min == min_spawn_interval and spawn_interval_max == min_spawn_interval:
		timer_acceleration.stop()
		print("Velocidad máxima alcanzada.")
