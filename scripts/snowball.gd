extends Node2D
<<<<<<< Updated upstream
var dir = 1
func _ready() -> void:
	add_to_group("snowball")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if dir == 1:
		global_position.x += delta*800
	else:
		global_position.x -= delta*800
=======


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.x += delta*800
>>>>>>> Stashed changes
