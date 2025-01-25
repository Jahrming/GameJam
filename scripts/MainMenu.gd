extends CanvasLayer

func _ready():
	# Conectar señales de los botones
	$Control/ButtonStart.connect("pressed", Callable(self, "_on_start_pressed"))
	$Control/ButtonExit.connect("pressed", Callable(self, "_on_exit_pressed"))

func _on_start_pressed():
	print("Botón Start presionado. Intentando cargar la escena de transición...")
	get_tree().change_scene_to_file("res://scenes/TransitionAnimation.tscn")

func _on_exit_pressed():
	print("Botón Exit presionado. Simulando salida del juego...")
	get_tree().quit()
