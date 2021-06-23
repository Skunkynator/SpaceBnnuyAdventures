tool
extends Resource
class_name Pattern


export var bulletAmount: float = 1
export var bulletAngleDiff: float = 10 setget setDegAngle, getDegAngle
export var bulletAngleRadDiff: float 
export var bullet_speed: float = 100


func setDegAngle(angle):
	bulletAngleRadDiff = deg2rad(angle)


func getDegAngle():
	return rad2deg(bulletAngleRadDiff)


func _shoot(position: Vector2,direction: Vector2,bullet: PackedScene,root: Node):
	var instance: Bullet
	var dir: Vector2
	for x in range(-bulletAmount + 1,bulletAmount + 1,2):
		dir = direction.rotated(x/2.0 * bulletAngleRadDiff)
		instance = bullet.instance()
		instance.direction = dir
		instance.position = position
		instance.speed = bullet_speed
		root.add_child(instance)
