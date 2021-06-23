extends Ship


export var slow_middle: bool = false
export var middle_strength: int = 10
var path_follow: PathFollow2D
var progress: float = 0


func _ready():
	if get_parent() is PathFollow2D:
		path_follow = get_parent()
	else:
		free()
		GameController.level_controller.ship_amount -= 1


func _process(delta):
	if slow_middle:
		var offset: float
		progress += speed * delta * 0.001
		offset = progress * 2 - 1
		offset = pow(offset, middle_strength * 2 + 1)
		offset = offset / 2 + 0.5
		path_follow.unit_offset = offset
	else:
		path_follow.offset += speed * delta
	if path_follow.unit_offset >= 1:
		free()
		GameController.level_controller.ship_amount -= 1
