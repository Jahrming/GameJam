extends Area2D

@export var speed: float = 200.0  # Velocidad del movimiento descendente

func _ready():
	set_process(true)  # Activa el movimiento descendente
	body_entered.connect(_on_body_entered)

func _process(delta):
	# Movimiento hacia abajo
	position.y += speed * delta

	# Elimina el obstáculo si sale de la pantalla
	if position.y > get_viewport().size.y + 50:
		queue_free()

# Detecta si el obstáculo toca al jugador
func _on_body_entered(body):
	if body.name == "Player":
		print("¡Jugador tocado por un obstáculo! Cambiando al MainMenu.")
		get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
