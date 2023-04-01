extends Node

onready var sound = get_node("generally")
var score = 0

func _ready():
	$HUD.show_message(get_tree().get_current_scene().get_name())

func _process(delta):
	if not sound.playing:
		sound.play()
