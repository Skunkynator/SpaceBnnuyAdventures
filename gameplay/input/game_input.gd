extends Node

signal shoot_pressed

var inputDirection = Vector2(0,0)
var _up_buttons := [KEY_W,KEY_UP]
var _down_buttons := [KEY_S,KEY_DOWN]
var _left_buttons := [KEY_A,KEY_LEFT]
var _right_buttons := [KEY_D,KEY_RIGHT]
var _shoot_buttons := [KEY_SPACE]
var _up_pressed_amount := 0
var _down_pressed_amount := 0
var _left_pressed_amount := 0
var _right_pressed_amount := 0
var _shoot_pressed_amount := 0


func _input(event):
	if event is InputEventKey:
		if event.echo: return
		var pressed := 1 if event.pressed else -1
		_up_pressed_amount += pressed if _up_buttons.has(event.scancode) else 0
		_down_pressed_amount += pressed if _down_buttons.has(event.scancode) else 0
		_left_pressed_amount += pressed if _left_buttons.has(event.scancode) else 0
		_right_pressed_amount += pressed if _right_buttons.has(event.scancode) else 0
		_shoot_pressed_amount += pressed if _shoot_buttons.has(event.scancode) else 0
		_up_pressed_amount = max(0,_up_pressed_amount)
		_down_pressed_amount = max(0,_down_pressed_amount)
		_left_pressed_amount = max(0,_left_pressed_amount)
		_right_pressed_amount = max(0,_right_pressed_amount)
		_shoot_pressed_amount = max(0,_shoot_pressed_amount)
		update_controll_dir()
		if _shoot_buttons.has(event.scancode):
			if event.pressed:
				emit_signal("shoot_pressed")
	pass


func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_FOCUS_OUT:
		_up_pressed_amount = 0
		_down_pressed_amount = 0
		_left_pressed_amount = 0
		_right_pressed_amount = 0
		_shoot_pressed_amount = 0
		update_controll_dir()
	pass


func update_controll_dir():
	inputDirection = (_up_pressed_amount - _down_pressed_amount) * Vector2.UP
	inputDirection += (_right_pressed_amount - _left_pressed_amount) * Vector2.RIGHT
	inputDirection = inputDirection.normalized()
	pass
