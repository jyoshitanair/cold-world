class_name Level extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$health.death.connect(reset)
	print("correct")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func reset() -> void:
	print("reset")
	Manager.death_count += 1
	get_tree().reload_current_scene()
	pass
