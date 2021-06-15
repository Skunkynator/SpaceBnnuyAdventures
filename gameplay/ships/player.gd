extends Ship
class_name Player


func _ready():
	GameController.player = self


func _process(delta):
	position += delta * GameInput.inputDirection * Speed
	clampToScreen()


func _shoot_bullets():
	var instance : Bullet
	var offset : Vector2
	while(health > 0):
		while(GameInput._shoot_pressed_amount != 0):
			_shoot()
			yield(get_tree().create_timer(shootDelta),"timeout")
		yield(GameInput,"shoot_pressed")


func clampToScreen():
	var screenSize = get_viewport_rect().size
	position.x = clamp(position.x,Size.x,screenSize.x - Size.x)
	position.y = clamp(position.y,Size.y,screenSize.y - Size.y)


func _on_bullet_hit(bullet: Bullet):
	if not bullet.playerBullet:
		print_debug("owo :" + str(health))
		health -= bullet.damage
		bullet._hit(bullet.damage)
