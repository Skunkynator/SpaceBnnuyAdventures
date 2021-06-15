extends Node2D
class_name Bullet


export var speed : float = 40
export var damage : float = 4
export var playerBullet : bool = true
export var direction: Vector2 = Vector2(0,-1)


func _process(delta):
	position += direction * delta * speed


func _on_bullet_screen_exited():
	queue_free()
	pass


func _hit(damage: float):
	queue_free()
