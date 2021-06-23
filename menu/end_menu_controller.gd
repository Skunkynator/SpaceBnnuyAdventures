extends Node


func _ready():
	pass


func _on_restart_button_pressed():
	GameController.start()


func _on_menu_button_pressed():
	GameController.load_main_menu()
