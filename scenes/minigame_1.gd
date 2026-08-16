extends Node2D

@onready var themed_timer: Node2D = $ThemedTimer

var chai_collected = 0
var timer_end = false

func _ready() -> void:
	await themed_timer.Timer(10.0)
	timer_end = true

func _process(_delta: float) -> void:
	if chai_collected == 3:
		if Global.minigames_done > 3:
			get_tree().change_scene_to_file("res://scenes/done_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://scenes/level_scene.tscn")
		return

	if timer_end:
		Global.minigames_done -= 1
		Global.lives -= 1

		if Global.lives <= 0:
			get_tree().change_scene_to_file("res://scenes/lose_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://scenes/level_scene.tscn")

func chai_collect() -> void:
	chai_collected += 1
	print("Collected:", chai_collected)
