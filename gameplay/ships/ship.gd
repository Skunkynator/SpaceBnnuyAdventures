extends Node2D
class_name Ship


export var health := 100.0
export var Speed: float = 80.0
export var shootDelta : float = 0.5
export var Size: Vector2 = Vector2(16,16)
export var projectile: PackedScene
export var patternRes: Resource setget set_pattern
var pattern: Pattern


func set_pattern(new_pattern):
	if new_pattern is Pattern:
		pattern = new_pattern


func _ready():
	if pattern is Pattern:
		_shoot_bullets()
	pass


func _on_ship_area_entered(area):
	if area.get_parent() is Bullet:
		_on_bullet_hit(area.get_parent())
	pass


func _on_bullet_hit(bullet: Bullet):
	if bullet.playerBullet:
		health -= bullet.damage
		if health <= 0:
			queue_free()
			bullet._hit(bullet.damage + health)
		else:
			bullet._hit(bullet.damage)


func _shoot_bullets():
	var dir: Vector2
	while(health > 0):
		dir = (GameController.player.global_position - global_position).normalized()
		pattern._shoot(global_position, dir, projectile,get_node("/root/Game"))
		#_shoot()
		yield(get_tree().create_timer(shootDelta),"timeout")


func _shoot():
	var instance : Bullet
	var offset : Vector2
	instance = projectile.instance()
	offset = instance.direction.normalized() * Size.length() / 3
	instance.position = position + offset
	get_parent().add_child(instance)
