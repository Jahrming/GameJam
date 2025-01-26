extends Area2D

@export var fall_gravity: float = 500.0  # Fuerza de la gravedad personalizada
@export var max_fall_speed: float = 300.0  # Velocidad máxima de caída

var velocity: Vector2 = Vector2.ZERO  # Velocidad actual del obstáculo

func _ready():
	# Conecta la señal de colisión con el jugador
	connect("body_entered", Callable(self, "_on_body_entered"))
	set_process(true)  # Activa la función _process para aplicar gravedad

func _process(delta):
	# Aplicar gravedad al obstáculo
	velocity.y = min(velocity.y + fall_gravity * delta, max_fall_speed)
	position += velocity * delta

	# Eliminar el obstáculo si sale de la pantalla
	if position.y > get_viewport().size.y + 50:
		queue_free()

# Detecta colisión con el jugador
func _on_body_entered(body):
	if body.name == "Player":  # Verifica si el nodo tocado es el jugador
		print("¡Jugador eliminado por un obstáculo!")
		get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")  # Cambia al MainMenu
