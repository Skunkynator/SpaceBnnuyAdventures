tool
extends Resource
class_name Pattern


export var bulletAmount: float = 1
export var bulletAngleDiff: float = 10 setget setDegAngle, getDegAngle
export var bulletAngleRadDiff: float 


func setDegAngle(angle):
	bulletAngleRadDiff = deg2rad(angle)


func getDegAngle():
	return rad2deg(bulletAngleRadDiff)


func _shoot(position: Vector2,direction: Vector2,bullet: PackedScene,root: Node):
	var instance: Bullet
	var dir: Vector2
	for x in range(-bulletAmount / 2.0,bulletAmount /2.0 + 1):
		dir = direction.rotated(x * bulletAngleRadDiff)
		instance = bullet.instance()
		instance.direction = dir
		instance.position = position
		root.add_child(instance)
