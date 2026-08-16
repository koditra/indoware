extends Node2D

@onready var self_area: Area2D = $Area2D
@onready var player_area: Area2D = $"../Player/Area2D"

var collected = false

func _process(_delta: float) -> void:
	if !collected and player_area.overlaps_area(self_area):
		collected = true
		get_parent().chai_collect()
		queue_free()
