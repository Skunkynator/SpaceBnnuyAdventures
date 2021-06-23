extends Node


signal score_changed


var player: Player
var score: float = 0 setget set_score
var game_root: Node2D
var level_list: LevelList = load("res://gameplay/levels/list.tres")
var upgrade_list: UpgradeList = load("res://gameplay/player/upgrades/list.tres")
var cur_level: int = 0
var level_controller: LevelController


func set_score(new_score):
	if new_score < 0:
		return
	score = new_score
	emit_signal("score_changed",new_score)


func start():
	MainPlayerData.reset()
	start_no_reset()


func start_no_reset():
	cur_level = 0
	get_tree().change_scene("res://gameplay/game.tscn")


func load_next():
	cur_level += 1
	if cur_level < level_list.levels.size():
		get_tree().change_scene("res://gameplay/game.tscn")
	else:
		get_tree().change_scene("res://menu/game_done.tscn")


func game_over():
	get_tree().change_scene("res://menu/game_over.tscn")


func update_game_root():
	game_root = get_node("/root/Main/Game")
	if game_root is LevelController:
		level_controller = game_root
		level_controller.current_level_path = level_list.levels[cur_level]


func load_upgrade():
	if cur_level + 1 < level_list.levels.size():
		get_tree().change_scene("res://gameplay/player/upgrades/upgrade_ui.tscn")
	else:
		get_tree().change_scene("res://menu/game_done.tscn")


func load_main_menu():
	get_tree().change_scene("res://menu/main_menu.tscn")
