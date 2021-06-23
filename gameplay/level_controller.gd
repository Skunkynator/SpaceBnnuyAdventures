extends Node2D


class_name LevelController


class shipSorter:
	static func sort(a,b):
		return a.time < b.time


export(Array, NodePath) var ship_paths: Array
export(Array, PackedScene) var ships: Array
var current_level_path
var level_length: float
var level_ships: Array
var paths: Array = []
var ship_amount: int setget set_ship_amount

func set_ship_amount(amount: int):
	ship_amount = amount
	if ship_amount <= 0:
		GameController.load_upgrade()


func _ready():
	GameController.update_game_root()
	MainPlayerData.apply_to_player(GameController.player)
	load_level()
	for node_path in ship_paths:
		paths.append(get_node(node_path))
	start_level()
	pass


func start_level():
	var cur_time = 0
	var cur_ship: Node2D
	var cur_follow: PathFollow2D
	for ship in level_ships:
		if ship.time > cur_time:
			yield(get_tree().create_timer(ship.time-cur_time),"timeout")
		if ships.size() <= ship.type or ship_paths.size() <= ship.path:
			set_ship_amount(ship_amount-1)
			continue
		cur_follow = PathFollow2D.new()
		cur_follow.rotate = false
		cur_follow.loop = false
		cur_ship = ships[ship.type].instance()
		cur_ship.position = Vector2.ZERO
		cur_follow.add_child(cur_ship)
		paths[ship.path].add_child(cur_follow)
		cur_time = ship.time


func load_level():
	var level = JSON.parse(load_file())
	if level.error != OK:
		return
	level = check_level_json(level.result)
	if level == null:
		return
	level.level.sort_custom(shipSorter,"sort")
	level_length = level.length
	level_ships = level.level
	ship_amount = level_ships.size()


func load_file():
	var file = File.new()
	file.open(current_level_path, File.READ)
	var content = file.get_as_text()
	file.close()
	return content


func check_level_json(json):
	if not json is Dictionary:
		return null
	if not("length" in json and "level" in json):
		return null
	if not json.level is Array:
		return null
	var json_ships: Array = json.level
	var removed_amount: int = 0
	var ship
	for ship_idx in range(0,json_ships.size()):
		ship = json_ships[ship_idx - removed_amount]
		if not ship is Dictionary or not "time" in ship:
			json_ships.remove(ship_idx - removed_amount)
			removed_amount += 1
			continue
		if not "type" in ship:
			ship.type = 0
		if not "path" in ship:
			ship.path = 0
	return json
