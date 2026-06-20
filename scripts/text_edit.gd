extends Node2D
@onready var line_edit: LineEdit = $TextEdit
@onready var button: Button = $Button
@onready var fail: Label = $fail
var loaded = false
func _ready() -> void:
	await SilentWolf.Scores.get_scores(0).sw_get_scores_complete
	loaded = true 
func _on_button_pressed() -> void:
	if loaded:
		print("clicked")
		button.disabled = true
		var check_value =check_name()
		print(check_value) 
		if check_value == false:
			print("true")
			Manager.player_name = line_edit.text
			var sw_result: Dictionary = await SilentWolf.Scores.save_score(Manager.player_name, Manager.score).sw_save_score_complete
			get_tree().change_scene_to_file("res://scenes/ending.tscn")
		else:
			button.disabled = false
			fail.show()
func check_name()-> bool:
	print(line_edit.text)
	if line_edit.text.strip_edges().to_lower() == "":
		fail.text = "empty."
		print("empty")
		return true
	for score_data in SilentWolf.Scores.scores:
			if score_data["player_name"].strip_edges().to_lower() ==  line_edit.text.strip_edges().to_lower():
				fail.text = "used."
				return true
	return false
