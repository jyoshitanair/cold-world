extends Area2D

var Health
var inside = false
var body1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Health = get_tree().get_first_node_in_group("health")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if inside and body1:
		if body1.is_in_group("player"):
			print("lala")
		Manager.level_one_calc = max(0, ((45 - Health.health) * 27) - (Manager.level_1_easiness * 5))
		if Manager.exit_ladder_2_entered == false:
			print("exit_ladder_2_entered is false")
			Manager.exit_ladder_2_entered = true
		elif Manager.exit_ladder_2_entered == true:
			print("exit_ladder_2_entered is true")
		if Manager.exit_ladder_1_entered == true:
			get_tree().call_deferred("change_scene_to_file", "res://scenes/level_2.tscn")


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		inside = true
		body1 = body
func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		inside = false
		body1 = null
