extends Control

@onready var main =  $"../../"


func _on_button_quit_pressed():
	get_tree().quit()


func _on_button_resume_pressed():
	main.pauseMenu()
