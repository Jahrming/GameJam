extends CanvasLayer

signal timer_finished  # Señal emitida cuando el tiempo llega a 0

var elapsed_time: float = 0.0  # Tiempo restante
var paused: bool = false  # Controla si el temporizador está en pausa

@onready var timer_label: Label = $TimerLabel

func start_countdown(start_time: float) -> void:
	# Inicializar la cuenta regresiva
	elapsed_time = start_time
	paused = false
	update_timer_label()

func _process(delta: float) -> void:
	if not paused:
		# Reducir el tiempo restante
		elapsed_time -= delta
		
		# Asegurarse de que no baje de 0
		if elapsed_time <= 0:
			elapsed_time = 0
			emit_signal("timer_finished")  # Emitir señal cuando llegue a 0
			return
		
		# Actualizar el texto del Label
		update_timer_label()

func pause_timer() -> void:
	# Pausar el temporizador
	paused = true

func resume_timer() -> void:
	# Reanudar el temporizador
	paused = false

func get_elapsed_time() -> float:
	# Devolver el tiempo restante
	return elapsed_time

func update_timer_label() -> void:
	# Mostrar el tiempo restante como un entero
	timer_label.text = "%d" % int(elapsed_time)
