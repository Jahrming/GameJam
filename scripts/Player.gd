extends CharacterBody2D

@export var speed: float = 300.0
@export var screen_limits: Vector2 = Vector2(50, 750)

var invulnerable: bool = false  # No usado en este caso, pero listo para futuros ajustes

func _process(delta):
	# Movimiento horizontal del jugador
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * speed
	move_and_slide()

	# Limitar la posición dentro de los límites de la pantalla
	position.x = clamp(position.x, screen_limits.x, screen_limits.y)
