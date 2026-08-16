extends Node2D

@onready var score: RichTextLabel = $Score

func _ready() -> void:
	score.text = "You completed " + str(Global.minigames_done) + " mini-games!"

func _on_play_again_pressed() -> void:
	Global.minigames_done = 0
	Global.lives = 5
	get_tree().change_scene_to_file("res://scenes/level_scene.tscn")
	
func _on_quit_pressed() -> void:
	get_tree().quit()
