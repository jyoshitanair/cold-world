extends TileMapLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func check_tile(col_pos) -> void: 
	var tile_data = get_cell_tile_data(col_pos)
	if tile_data:
		var group = tile_data.get_custom_data("tile_group")
		print(group)
		if group == "jelly":
			print("jellah detected")
