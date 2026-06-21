extends Area2D
var body1
var inside = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if inside and body1: 
		if body1.is_in_group("player"):
			print("LALALA")
		if Manager.exit_ladder_1_entered == false:
			print("exit_ladder_1_entered is false")
			Manager.exit_ladder_1_entered = true
		elif Manager.exit_ladder_1_entered == true:
			print("exit_ladder_1_entered is true")
		if Manager.exit_ladder_2_entered == true:
			Manager.exit_ladder_1_entered = false
			Manager.exit_ladder_2_entered = false
			get_tree().call_deferred("change_scene_to_file", "res://scenes/level_2.tscn")
	

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		inside = true
		body1 = body
func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		inside = false
		body1 = null
		
