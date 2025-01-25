extends Button

func _ready():
	# Conectar la señal "pressed" del botón
	self.connect("pressed", Callable(self, "_on_pressed"))

func _on_pressed():
	print("Botón Start presionado. Cargando la escena de transición...")
	get_tree().change_scene_to_file("res://scenes/TransitionAnimation.tscn")
