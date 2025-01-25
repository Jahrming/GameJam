extends Node2D

@export var speed := 200.0  # Velocidad del obstáculo

func _ready():
	set_process(true)  # Activar el procesamiento en cada frame

func _process(delta):
	# Mover el obstáculo hacia abajo
	position.y += speed * delta

	# Eliminar el obstáculo si sale de la pantalla
	if position.y > get_viewport().size.y + 50:  # Un poco fuera de la pantalla
		queue_free()

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		print("¡Colisión con el jugador! Juego terminado.")
		get_tree().change_scene_to_file("res://scenes/GameOver.tscn")  # Cambiar a la escena de Game Over
