extends ParallaxBackground


export var speed: float = 1000


func _process(delta):
	scroll_offset.y += speed * delta
