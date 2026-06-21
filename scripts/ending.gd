extends Node2D
#Score = Max(0, 
#((45 - Time) * 8000 * Level) - (Deaths * 400 * Level) - (Easiness * 150 * Level))
var score = 0 
@onready var button: Button = $Button
func _on_button_pressed() -> void:
	#button.disabled = true
	#score = randi_range(0,9)
	#Manager.score = score
	get_tree().change_scene_to_file("res://scenes/leaderboard.tscn")
