extends Area2D

var Health

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Health = get_tree().get_first_node_in_group("health")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("lala")
		#Manager.level_one_calc = max(0, ((45 - Health.health) * 27) - (Manager.level_1_easiness * 5))
		if Manager.exit_ladder_2_entered == false:
			print("exit_ladder_2_entered is false")
			Manager.exit_ladder_2_entered = true
		elif Manager.exit_ladder_2_entered == true:
			print("exit_ladder_2_entered is true")
		if Manager.exit_ladder_1_entered == true:
			Manager.exit_ladder_1_entered = false
			Manager.exit_ladder_2_entered = false
			get_tree().call_deferred("change_scene_to_file", "res://scenes/level_2.tscn")
