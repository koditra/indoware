extends Node2D

@onready var chai_container: HBoxContainer = $ChaiContainer
@onready var chai: TextureRect = $ChaiContainer/Chai
@onready var chai_2: TextureRect = $ChaiContainer/Chai2
@onready var chai_3: TextureRect = $ChaiContainer/Chai3
@onready var chai_4: TextureRect = $ChaiContainer/Chai4
@onready var chai_5: TextureRect = $ChaiContainer/Chai5
@onready var level: RichTextLabel = $Level
@onready var timer: RichTextLabel = $Timer

var time = 0.0

func _ready() -> void:
	await Timer(5.0)

	if Global.lives <= 0:
		get_tree().change_scene_to_file("res://scenes/lose_screen.tscn")
		return

	if Global.minigames_done < 2:
		Global.minigames_done += 1
		get_tree().change_scene_to_file("res://scenes/minigame_" + str(Global.minigames_done) + ".tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/done_screen.tscn")

func _process(_delta: float) -> void:
	match Global.lives:
		5:
			pass
		4:
			chai.hide()
		3:
			chai.hide()
			chai_2.hide()
		2:
			chai.hide()
			chai_2.hide()
			chai_3.hide()
		1:
			chai.hide()
			chai_2.hide()
			chai_3.hide()
			chai_4.hide()
		0:
			chai_container.hide()

	timer.text = str(snapped(time, 0.1))
	level.text = "Level " + str(Global.minigames_done + 1)

func Timer(start_time: float) -> void:
	time = start_time

	while time > 0.0:
		await wait(0.1)
		time -= 0.1

	time = 0.0

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
