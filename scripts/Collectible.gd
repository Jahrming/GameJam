extends Area2D

@export var fall_speed: float = 150.0  # Velocidad de caída del coleccionable

func _process(delta):
	# Mueve el coleccionable hacia abajo
	position.y += fall_speed * delta

	# Elimina el coleccionable si sale de la pantalla
	if position.y > get_viewport().size.y + 50:
		queue_free()

# Detecta si el jugador recolecta el coleccionable
func _on_body_entered(body):
	if body.name == "Player":  # Verifica si el jugador colisiona
		get_parent().increment_progress()  # Llama al método en el nivel
		queue_free()  # Elimina el coleccionable
