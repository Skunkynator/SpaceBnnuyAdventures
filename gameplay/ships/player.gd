extends Ship
class_name Player


func _ready():
	pass


func _process(delta):
	position += delta * GameInput.inputDirection * Speed
	clampToScreen()
	var instance : Node2D = projectile.instance()
	instance.position = position
	get_parent().add_child(instance)


func clampToScreen():
	var screenSize = get_viewport_rect().size
	position.x = clamp(position.x,Size.x,screenSize.x - Size.x)
	position.y = clamp(position.y,Size.y,screenSize.y - Size.y)
