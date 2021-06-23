extends Node


export var main_path: NodePath
export var settings_path: NodePath
var main: Control
var settings: Control


func _ready():
	main = get_node(main_path)
	settings = get_node(settings_path)
	open_main()


func _on_playbtn_pressed():
	GameController.start()
	pass


func open_settings():
	main.hide()
	settings.show()
	pass


func open_main():
	settings.hide()
	main.show()
	pass
