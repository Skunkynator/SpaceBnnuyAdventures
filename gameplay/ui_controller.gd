extends Node


export var score_label_path: NodePath
export var health_bar_path: NodePath
var score_label
var health_bar: TextureProgress


func _ready():
	score_label = get_node(score_label_path)
	if score_label is Label:
		update_label(score_label)
	pass
	var node = get_node(health_bar_path)
	if node is TextureProgress:
		health_bar = node
		update_health_bar(health_bar)


func update_label(label: Label):
	while true:
		label.text = str(GameController.score) + "$"
		yield(GameController,"score_changed")


func update_health_bar(health_bar: TextureProgress):
	while GameController.player.health > 0:
		health_bar.value = GameController.player.health
		yield(GameController.player,"health_changed")
