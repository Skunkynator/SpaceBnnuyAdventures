extends Node2D
class_name Ship


export var health := 100.0
export var Speed: float = 80.0
export var Size: Vector2 = Vector2(16,16)
export var projectile: PackedScene


func _ready():
	pass


func _on_ship_area_entered(area):
	if area.get_parent() is Bullet:
		_onBulletHit(area)
	pass


func _onBulletHit(bullet: Bullet):
	pass
