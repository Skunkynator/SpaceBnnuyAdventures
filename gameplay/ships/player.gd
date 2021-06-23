extends Ship
class_name Player


signal health_changed


func _ready():
	GameController.player = self


func _process(delta):
	position += delta * GameInput.inputDirection * speed
	clampToScreen()


func _shoot_bullets():
	var dir : Vector2 # direction
	while(health > 0):
		while(GameInput._shoot_pressed_amount):
			dir = Vector2.UP
			dir = dir.rotated(-0.3) if GameInput._left_pressed_amount else dir
			dir = dir.rotated(0.3) if GameInput._right_pressed_amount else dir
			dir.y -= 0.4 if GameInput._up_pressed_amount else .0
			pattern._shoot(global_position, dir, projectile,GameController.game_root)
			yield(get_tree().create_timer(shootDelta),"timeout")
		yield(GameInput,"shoot_pressed")


func clampToScreen():
	var screenSize = get_viewport_rect().size
	position.x = clamp(position.x,Size.x,screenSize.x - Size.x)
	position.y = clamp(position.y,Size.y,screenSize.y - Size.y)


func _on_bullet_hit(bullet: Bullet):
	if not bullet.playerBullet:
		health -= bullet.damage
		bullet._hit(bullet.damage)
		emit_signal("health_changed")
		if health <= 0:
			GameController.game_over()
