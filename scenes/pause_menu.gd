extends Control

@export var main_menu_scene: String = "res://scenes/MainMenu.tscn"  # Ruta a la escena del menú principal

func _ready():
	# Encuentra los botones y conecta sus señales
	var resume_button = $MarginContainer/HBoxContainer/reanudar
	var restart_button = $MarginContainer/HBoxContainer/reiniciar
	var back_button = $MarginContainer/HBoxContainer/atras

	if resume_button:
		resume_button.pressed.connect(_on_resume_pressed)
	else:
		print("Error: No se encontró el botón 'rea'.")

	if restart_button:
		restart_button.pressed.connect(_on_restart_pressed)
	else:
		print("Error: No se encontró el botón 'rein'.")

	if back_button:
		back_button.pressed.connect(_on_back_to_menu_pressed)
	else:
		print("Error: No se encontró el botón 'atra'.")

# Reanudar el juego
func _on_resume_pressed():
	print("Reanudar presionado")
	get_tree().paused = false  # Despausar el juego
	hide()  # Oculta el menú de pausa

# Reiniciar el nivel actual
func _on_restart_pressed():
	print("Reiniciar presionado")
	var current_scene = get_tree().current_scene  # Obtiene la escena actual
	if current_scene:
		get_tree().paused = false  # Despausar el juego
		get_tree().reload_current_scene()  # Recarga la escena actual

# Volver al menú principal
func _on_back_to_menu_pressed():
	print("Volver al menú principal presionado")
	get_tree().paused = false  # Despausar el juego
	get_tree().change_scene_to_file(main_menu_scene)  # Cambia a la escena del menú principal
