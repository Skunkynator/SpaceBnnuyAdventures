extends Node


export(Array,NodePath) var upgrade_btn_paths
export(NodePath) var money_label_path: NodePath
var upgrade_btns: Array
var rng = RandomNumberGenerator.new()



func _ready():
	rng.randomize()
	var btn
	for btn_path in upgrade_btn_paths:
		btn = get_node(btn_path)
		if btn is UpgradeButton:
			upgrade_btns.append(btn)
			set_upgrade_data(btn)
	var score_label = get_node(money_label_path)
	if score_label is Label:
		update_label(score_label)


func _on_continue_btn_pressed():
	GameController.load_next()


func set_upgrade_data(btn: UpgradeButton):
	var upgrade_amount = GameController.upgrade_list.list.size()
	var upgrade: Upgrade
	upgrade = GameController.upgrade_list.list[rng.randi_range(0,upgrade_amount-1)]
	btn.upgrade = upgrade
	btn.price = 100
	btn.root = self


func update_upgrade_prices():
	for btn in upgrade_btns:
		btn.price = 100 + pow(MainPlayerData.upgrade_amount,2)


func update_label(label: Label):
	while true:
		label.text = str(GameController.score) + "$"
		yield(GameController,"score_changed")
