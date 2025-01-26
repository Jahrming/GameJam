extends CharacterBody2D

@export var speed: float = 300.0  # Velocidad de movimiento del jugador
@export var max_lives: int = 3  # Máximo de vidas del jugador

var current_lives: int = max_lives  # Vidas actuales del jugador
var invulnerable: bool = false  # Controla si el jugador es invulnerable

func _ready():
	print("¡Jugador inicia con %d vidas!" % max_lives)

func _process(delta):
	# Movimiento del jugador
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * speed
	move_and_slide()

func take_damage():
	if invulnerable:
		return  # Salir si el jugador es invulnerable

	# Reducir una vida
	current_lives -= 1
	print("¡Jugador perdió una vida! Vidas restantes: %d" % current_lives)

	# Revisar si el jugador ha perdido todas sus vidas
	if current_lives <= 0:
		die()  # Llama a la función de muerte
		return

	# Activar invulnerabilidad temporal
	invulnerable = true
	$CollisionShape2D.disabled = true  # Desactivar colisión temporalmente
	await get_tree().create_timer(1.0).timeout  # Esperar 1 segundo
	invulnerable = false
	$CollisionShape2D.disabled = false  # Reactivar colisión

func die():
	print("¡Jugador perdió todas las vidas! Cambiando al GameOver...")
	get_tree().change_scene_to_file("res://scenes/GameOver.tscn")
