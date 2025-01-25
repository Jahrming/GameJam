extends Node2D

@export var spawn_interval := 1.0       # Intervalo entre generación
@export var max_obstacles := 40         # Número máximo de obstáculos
@export var screen_width := Vector2(50, 750)  # Límites de generación horizontal

var obstacles_spawned := 0  # Contador de obstáculos generados
var template_node  # Referencia al nodo plantilla

func _ready():
	# Obtener la plantilla desde el nodo ObstacleTemplate
	template_node = $"../Obstacles/ObstacleTemplate"
	if not template_node:
		print("Error: No se encontró la plantilla de obstáculos.")
		return

	# Comenzar la generación de obstáculos
	get_tree().create_timer(spawn_interval, true).connect("timeout", Callable(self, "spawn_obstacle"))

func spawn_obstacle():
	if obstacles_spawned >= max_obstacles:
		return  # No generar más si se alcanza el límite

	# Instanciar un nuevo obstáculo
	var obstacle = template_node.duplicate()
	obstacle.name = "Obstacle_%d" % obstacles_spawned  # Nombre único para cada obstáculo
	obstacle.position = Vector2(randf_range(screen_width.x, screen_width.y), -50)  # Posición inicial
	$"../Obstacles".add_child(obstacle)  # Agregar al contenedor de obstáculos
	obstacles_spawned += 1

