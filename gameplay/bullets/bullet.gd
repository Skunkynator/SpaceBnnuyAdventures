extends Node2D
class_name Bullet


export var damage : float = 4
export var playerBullet : bool = true
var direction: Vector2 = Vector2(0,1) setget set_direction,get_direction


func _process(delta):
	position += direction * delta

func set_direction(dir: Vector2):
	pass


func get_direction():
	return direction
