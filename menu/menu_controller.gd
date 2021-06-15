extends Node


func _ready():
	pass


func _on_playbtn_pressed():
	get_tree().change_scene("res://gameplay/game.tscn")
	pass
