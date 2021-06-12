extends Node

var inputDirection = Vector2(0,0)
var _up_buttons := [KEY_W,KEY_UP]
var _down_buttons := [KEY_S,KEY_DOWN]
var _left_buttons := [KEY_A,KEY_LEFT]
var _right_buttons := [KEY_D,KEY_RIGHT]
var _up_pressed := 0
var _down_pressed := 0
var _left_pressed := 0
var _right_pressed := 0


func _input(event):
	if event is InputEventKey:
		if event.echo: return
		var pressed := 1 if event.pressed else -1
		_up_pressed += pressed if _up_buttons.has(event.scancode) else 0
		_down_pressed += pressed if _down_buttons.has(event.scancode) else 0
		_left_pressed += pressed if _left_buttons.has(event.scancode) else 0
		_right_pressed += pressed if _right_buttons.has(event.scancode) else 0
		_up_pressed = max(0,_up_pressed)
		_down_pressed = max(0,_down_pressed)
		_left_pressed = max(0,_left_pressed)
		_right_pressed = max(0,_right_pressed)
		update_controll_dir()
	pass


func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_FOCUS_OUT:
		_up_pressed = 0
		_down_pressed = 0
		_left_pressed = 0
		_right_pressed = 0
		update_controll_dir()
	pass


func update_controll_dir():
	inputDirection = (_up_pressed - _down_pressed) * Vector2.UP
	inputDirection += (_right_pressed - _left_pressed) * Vector2.RIGHT
	inputDirection = inputDirection.normalized()
	pass
