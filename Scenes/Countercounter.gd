extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var tiles_using
var tile_removed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	tiles_using = get_used_cells()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if tile_removed:
		print("YES")
		if tiles_using.size() != 0:
			set_cellv(tiles_using[-1], -1)
			tiles_using.resize(tiles_using.size()-1)
		tile_removed = false
		
		
