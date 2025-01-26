extends Button

func _ready():
	# Conectar la señal "pressed" del botón
	self.connect("pressed", Callable(self, "_on_pressed"))

func _on_pressed():
	print("Botón Exit presionado. Cerrando el juego...")
	get_tree().quit()
