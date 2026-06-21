extends Node2D
#Score = Max(0, 
#((45 - Time) * 8000 * Level) - (Deaths * 400 * Level) - (Easiness * 150 * Level))
var score = 0 
@onready var button: Button = $Button
func _on_button_pressed() -> void:
	Manager.score = Manager.level_one_calc + Manager.level_two_calc + Manager.level_three_calc
	var player_name = Manager.player_name
	SilentWolf.Scores.save_score(Manager.player_name, Manager.score, "main")
	get_tree().change_scene_to_file("res://scenes/leaderboard.tscn")
