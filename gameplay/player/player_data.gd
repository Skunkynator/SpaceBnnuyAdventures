extends Node


class_name PlayerData


var speed: float = 80
var bullet_amount: int = 1
var bullet_angle: float = 20
var shot_speed: float = 4
var bullet_speed: float = 100
var bullet_damage: float = 4  # doesnt function
var upgrade_amount: int = 0


func apply_to_player(player: Player):
	player.speed = speed
	player.shootDelta = 1 / shot_speed
	var playerPattern: Pattern = player.pattern
	playerPattern.bulletAmount = bullet_amount
	playerPattern.bulletAngleDiff = bullet_angle
	playerPattern.bullet_speed = bullet_speed
	player.pattern = playerPattern


func reset():
	speed = 80
	bullet_amount = 1
	bullet_angle = 20
	shot_speed = 4
	bullet_speed = 100
	upgrade_amount = 0
