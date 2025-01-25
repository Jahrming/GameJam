extends Node2D

var obstacles_avoided := 0  # Contador de obstáculos esquivados
@export var max_obstacles_to_win := 40  # Cantidad necesaria para ganar

func _ready():
	print("¡Nivel iniciado!")
	# Conectar detección de obstáculos generados al nodo Obstacles
	foreach_obstacle()

func foreach_obstacle():
	for child in $"Obstacles".get_children():
		child.connect("queue_free", Callable(self, "_on_obstacle_passed"))

func _on_obstacle_passed():
	obstacles_avoided += 1
	print("Obstáculos esquivados: %d" % obstacles_avoided)
	if obstacles_avoided >= max_obstacles_to_win:
		print("¡Nivel completado! Cargando el siguiente nivel...")
		get_tree().change_scene_to_file("res://scenes/Level2.tscn")  # Cambiar al siguiente nivel
