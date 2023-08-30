extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var tiles_using
var tile_removed = false
var turn_active = false
var player_num = "1"

var counter_sprite
var clear_sprite
# Called when the node enters the scene tree for the first time.
func _ready():
	counter_sprite = load("res://Assets/Counter"+player_num+".png")
	clear_sprite = load("res://Assets/clearcounter.png")
	tiles_using = get_used_cells()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if turn_active and get_node("Player" + player_num + "Sprite").texture == clear_sprite:
		get_node("Player" + player_num + "Sprite").texture = counter_sprite
	else:
		pass
		print(turn_active)
#		get_node("Player" + player_num + "Sprite").texture = clear_sprite
	if tile_removed:
		print("YES")
		if tiles_using.size() != 0:
			set_cellv(tiles_using[-1], -1)
			tiles_using.resize(tiles_using.size()-1)
		tile_removed = false
		
		
