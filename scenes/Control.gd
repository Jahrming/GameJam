extends Control


func _on_jugar_pressed():
	get_tree().change_scene_to_file("res://scenes/Level1.tscn")


func _on_salir_pressed():
	get_tree().quit()
