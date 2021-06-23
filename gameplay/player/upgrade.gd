extends Resource


class_name Upgrade


export var name: String = ""
export var player_speed_amount: float = 0
export(int, "add", "multiply") var player_speed_type = 0
export var bullet_speed_amount: float = 0
export(int, "add", "multiply") var bullet_speed_type = 0
export var bullet_angle_amount: float = 0
export(int, "add", "multiply") var bullet_angle_type = 0
export var bullet_amount_amount: float = 0
export(int, "add", "multiply") var bullet_amount_type = 0
export var shot_speed_amount: float = 0
export(int, "add", "multiply") var shot_speed_type = 0


func apply(player_data: PlayerData):
	player_data.speed = modify(player_data.speed,
			player_speed_amount,player_speed_type)
	player_data.bullet_speed = modify(player_data.bullet_speed,
			bullet_speed_amount,bullet_speed_type)
	player_data.bullet_angle = modify(player_data.bullet_angle,
			bullet_angle_amount,bullet_angle_type)
	player_data.bullet_amount = modify(player_data.bullet_amount,
			bullet_amount_amount,bullet_amount_type)
	player_data.shot_speed = modify(player_data.shot_speed,
			shot_speed_amount,shot_speed_type)
	player_data.upgrade_amount += 1


func modify(base,amount,type):
	if type == 0:
		return base + amount
	if type == 1:
		return base * amount
