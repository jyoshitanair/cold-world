extends Node2D
var score = 0 
@onready var button: Button = $Button
func _on_button_pressed() -> void:
	button.disabled = true
	score = randi_range(0,9)
	Manager.score = score
	get_tree().change_scene_to_file("res://scenes/leaderboard.tscn")
