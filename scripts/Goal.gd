extends Area2D

var meta_active := false  # Indica si la meta está activa

# Activa o desactiva la meta
func set_meta_active(active: bool) -> void:
	meta_active = active
	$CollisionShape2D.disabled = not active  # Activa o desactiva la colisión
	print("Meta activa: %s" % active)

func _ready():
	$CollisionShape2D.disabled = true  # Desactiva la colisión inicialmente
	body_entered.connect(_on_body_entered)

# Detecta si el jugador entra en la meta
func _on_body_entered(body):
	if body.name == "Player" and meta_active:
		get_parent().on_player_reaches_goal()
