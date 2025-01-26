extends Control



func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://scenes/Level1.tscn")
	Engine.time_scale = 1


func _on_texture_button_2_pressed():
	get_tree().change_scene_to_file("res://scenes/Level1.tscn")
	Engine.time_scale = 1


func _on_texture_button_3_pressed():
	get_tree().change_scene_to_file("res://scenes/Level1.tscn")
	Engine.time_scale = 1


func _on_texture_button_4_pressed():
	get_tree().change_scene_to_file("res://scenes/Level1.tscn")
	Engine.time_scale = 1


func _on_texture_button_5_pressed():
	get_tree().change_scene_to_file("res://scenes/Level1.tscn")
	Engine.time_scale = 1


func _on_quit_pressed():
	get_tree().quit()
