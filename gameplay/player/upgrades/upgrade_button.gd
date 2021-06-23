extends TextureButton
class_name UpgradeButton


export(NodePath) var name_label_path
export(NodePath) var price_label_path
var name_label: Label
var price_label: Label
var upgrade_name: String setget set_name
var price: float setget set_price
var upgrade: Upgrade setget set_upgrade
var root


func set_name(new_name: String):
	upgrade_name = new_name
	name_label.text = new_name


func set_price(new_price: float):
	price = new_price
	price_label.text = str(new_price) + "$"


func set_upgrade(new_upgrade: Upgrade):
	upgrade = new_upgrade
	set_name(upgrade.name)


func _ready():
	var label = get_node(name_label_path)
	if label is Label:
		name_label = label
	label = get_node(price_label_path)
	if label is Label:
		price_label = label


func _on_upgrade_btn_pressed():
	if GameController.score < price:
		return
	GameController.score -= price
	upgrade.apply(MainPlayerData)
	root.set_upgrade_data(self)
	root.update_upgrade_prices()
	pass # Replace with function body.
