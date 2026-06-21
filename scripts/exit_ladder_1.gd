extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("LALALA")
		if Manager.exit_ladder_1_entered == false:
			print("exit_ladder_1_entered is false")
			Manager.exit_ladder_1_entered = true
		elif Manager.exit_ladder_1_entered == true:
			print("exit_ladder_1_entered is true")
		if Manager.exit_ladder_2_entered == true:
			get_tree().change_scene_to_file("res://scenes/level_2.tscn")
