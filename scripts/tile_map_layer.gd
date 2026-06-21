extends TileMapLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func check_tile_1(col_pos,collider) -> void:
	var player_1 = get_tree().get_first_node_in_group("jelly")
	player_1.gravity_scale = 1.0 
	var tile_data = get_cell_tile_data(col_pos)
	if tile_data:
		var group = tile_data.get_custom_data("tile_group")
		if group == "jelly":
			if player_1 == collider:
				print(player_1)
				player_1.gravity_scale = 0.4
				

func check_tile_2(col_pos,collider) -> void:
	var player_2 = get_tree().get_first_node_in_group("bean")
	var tile_data = get_cell_tile_data(col_pos)
	if tile_data:
		var group = tile_data.get_custom_data("tile_group")
		if group == "green_pressure_plate":
			if player_2 == collider:
				print("Pressure plate pressed")
				
