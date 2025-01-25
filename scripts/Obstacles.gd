extends Node2D

func _ready():
	# Configurar la velocidad de movimiento
	set_process(true)

func _process(delta):
	# Mover hacia abajo
	position.y += 200 * delta  # Cambiar "200" según la velocidad deseada

	# Eliminar el obstáculo si sale de la pantalla
	if position.y > get_viewport().size.y + 50:
		queue_free()  # Se elimina a sí mismo
