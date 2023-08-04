extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var counter = preload("res://Counter.tscn")
var mouse_pos
var board_tiles
var tile_pos
var mouse_tile_pos
onready var tiles = $TileMap
# Called when the node enters the scene tree for the first time.
func _ready():
	board_tiles = tiles.get_used_cells_by_id(0)
#	print(board_tiles)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mouse_pos = to_local(get_global_mouse_position())
	#print(board_tiles.min())
	mouse_tile_pos = tiles.world_to_map(mouse_pos)
#	print(board_tiles.min()[0])
	tile_pos = tiles.map_to_world(mouse_tile_pos)
	if (mouse_tile_pos[0] >= board_tiles.min()[0]) and (mouse_tile_pos[0] <= board_tiles.max()[0]):
#		print(mouse_tile_pos[0]-board_tiles.min()[0])
		
		
		for i in (board_tiles.max()[0]-board_tiles.min()[0]+1):
			if ((i+board_tiles.min()[0])==mouse_tile_pos[0]):
				pass
#				tiles.set_cellv(Vector2(mouse_tile_pos[0], board_tiles.min()[1]-1), 1)
			else:
				pass
#				tiles.set_cellv(Vector2(i+board_tiles.min()[0], board_tiles.min()[1]-1), -1)
#			print(i)
		
	else:
#		print("no")
		pass
	
func _input(event):
   # Mouse in viewport coordinates.
	if event.is_action_pressed("click"):  
		if (mouse_tile_pos[0] >= board_tiles.min()[0]) and (mouse_tile_pos[0] <= board_tiles.max()[0]):
			print("Counter dropped at: ", mouse_tile_pos[0]-board_tiles.min()[0])
			var currentCounter = counter.instance()
			add_child(currentCounter)
			currentCounter.position = tiles.map_to_world(Vector2(mouse_tile_pos[0], (board_tiles.min()[1]-1)))
	
	
