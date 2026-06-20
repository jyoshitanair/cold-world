extends Node2D
@onready var text_edit: TextEdit = $TextEdit
@onready var button: Button = $Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	button.disabled = true
	Manager.player_name = text_edit.text
	var sw_result: Dictionary = await SilentWolf.Scores.save_score(Manager.player_name, Manager.score).sw_save_score_complete
	get_tree().change_scene_to_file("res://scenes/ending.tscn")
