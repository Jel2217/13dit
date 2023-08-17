extends Node2D


onready var counter = preload("res://Counter.tscn")
onready var counter_1_sprite = preload("res://Assets/Counter1.png")
onready var counter_2_sprite = preload("res://Assets/Counter2.png")

var mouse_pos
var board_tiles
var tile_pos
var mouse_tile_pos

var currentCounter
var counter_pos
var bounce_counter = 0
var can_drop = true

var turn_count = 0
var turn = 1
var player_count = 2
var current_sprite 

onready var tiles = $TileMap
# Called when the node enters the scene tree for the first time.
func _ready():
	board_tiles = tiles.get_used_cells_by_id(0)
#	print(board_tiles)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mouse_pos = to_local(get_global_mouse_position())
	mouse_tile_pos = tiles.world_to_map(mouse_pos)
	
	match turn:
		1: 
			current_sprite = counter_1_sprite
#			print("Player 1's turn")
			land_counter(1, 3, 1)
		2:
			current_sprite = counter_2_sprite
#			print("Player 2's turn")
			land_counter(4, 5, 2)
	


func land_counter(tile_id, clear_tile_id, player):
#	print(can_drop)
#	print(bounce_counter)
	tile_pos = tiles.map_to_world(mouse_tile_pos)
	if is_instance_valid(currentCounter):
		can_drop = false
		for i in (board_tiles.max()[0]-board_tiles.min()[0]+1):
			tiles.set_cellv(Vector2(i+board_tiles.min()[0], board_tiles.min()[1]-1), -1)
		if bounce_counter >= 5:
			can_drop = true
			bounce_counter = 0
			counter_pos = currentCounter.position
#			print("Landed at: " + String(tiles.world_to_map(currentCounter.position)))
			var cell_pos = tiles.world_to_map(Vector2(currentCounter.position))
			tiles.set_cellv(cell_pos,tile_id)
			var winner = register(cell_pos, tile_id, player)
			if winner != null:
				print("Player " + String(winner.player) + " won!")
				print(winner.counters)
				for i in winner.counters:
					tiles.set_cellv(i, -1)
			if turn == player_count:
				turn = 1
			else:
				turn += 1
			currentCounter.free()
		elif currentCounter.get_colliding_bodies().size() == 1:
			bounce_counter += 1
#			print(bounce_counter)
			
#			print(currentCounter.get_colliding_bodies().size())
			
#			counter_pos = currentCounter.position
##			print("Landed at: " + String(tiles.world_to_map(currentCounter.position)))
#			var cell_pos = tiles.world_to_map(Vector2(currentCounter.position))
#			tiles.set_cellv(cell_pos,tile_id)
#			var winner = register(cell_pos, tile_id, player)
#			if winner != null:
#				print("Player " + String(winner.player) + " won!")
#				print(winner.counters)
#			currentCounter.free()
	elif (mouse_tile_pos[0] >= board_tiles.min()[0]) and (mouse_tile_pos[0] <= board_tiles.max()[0]) and can_drop:
		for i in (board_tiles.max()[0]-board_tiles.min()[0]+1):
			if ((i+board_tiles.min()[0])==mouse_tile_pos[0]):
				pass
				tiles.set_cellv(Vector2(mouse_tile_pos[0], board_tiles.min()[1]-1), clear_tile_id)
			else:
				pass
				tiles.set_cellv(Vector2(i+board_tiles.min()[0], board_tiles.min()[1]-1), -1)
	else:
		
		for i in (board_tiles.max()[0]-board_tiles.min()[0]+1):
			tiles.set_cellv(Vector2(i+board_tiles.min()[0], board_tiles.min()[1]-1), -1)


func register(counter_pos, tile_id, player):
	var counters_in_a_row = 0
	var winning_counters = []
	
	var vertical_tiles = []
	for i in board_tiles: # Vertical testing
		if (i[0] == counter_pos[0]):
			vertical_tiles.append(i)
			
	vertical_tiles.sort()
	for i in vertical_tiles:
		if (tiles.get_cellv(i) == tile_id):
			if (tiles.get_cell(i[0], i[1]-1) != tile_id and counters_in_a_row < 4):
				counters_in_a_row = 1
				winning_counters.clear()
				winning_counters.append(i)
			elif counters_in_a_row < 4:
				counters_in_a_row += 1
				winning_counters.append(i)
	
	if counters_in_a_row >= 4:
		return {"player":player, "counters":winning_counters}
	else:
		counters_in_a_row = 0
	
	
	# HORIZONTAL TESTING
	var horizontal_tiles = []
	for i in board_tiles:
		if (i[1] == counter_pos[1]):
			horizontal_tiles.append(i)
	
	horizontal_tiles.sort()
	for i in horizontal_tiles:
		if (tiles.get_cellv(i) == tile_id):
			if (tiles.get_cell(i[0]-1, i[1])!= tile_id):
				counters_in_a_row = 1
				winning_counters.clear()
#				winning_counters.append(i)
			else:
				counters_in_a_row += 1
				winning_counters.append(i)
		
	if counters_in_a_row >= 4:
		return {"player":player, "counters":winning_counters}
	else:
		counters_in_a_row = 0
	
	var x = 1
	
	
	var diagonal_left_tiles = []
	while (tiles.get_cell(counter_pos[0]+x, counter_pos[1]+x) != -1) and (tiles.get_cell(counter_pos[0], counter_pos[1]+x) != 6):
#			tiles.set_cell(counter_pos[0]+x, counter_pos[1]+x, tile_id)
			diagonal_left_tiles.append(Vector2(counter_pos[0]+x, counter_pos[1]+x))
			x += 1
			
	x = 0
	while (tiles.get_cell(counter_pos[0]-x, counter_pos[1]-x) != -1):
#		tiles.set_cell(counter_pos[0]-x, counter_pos[1]-x, tile_id)
		diagonal_left_tiles.append(Vector2(counter_pos[0]-x, counter_pos[1]-x))
		x += 1
	diagonal_left_tiles.sort_custom(array_sorter, "sort")
#	print(diagonal_left_tiles)
	
	
	for i in diagonal_left_tiles:
#		print(i)
		if (tiles.get_cellv(i) == tile_id):
			counters_in_a_row += 1
			winning_counters.append(i)
		elif counters_in_a_row < 4:
			counters_in_a_row = 0
			winning_counters.clear()
#			winning_counters.append(i)
#		print(counters_in_a_row)
	
	if counters_in_a_row >= 4:
		return {"player":player, "counters":winning_counters}
	else:
		counters_in_a_row = 0
	
	x = 0
	var diagonal_right_tiles = []
	while (tiles.get_cell(counter_pos[0]-x, counter_pos[1]+x) != -1) and (tiles.get_cell(counter_pos[0], counter_pos[1]+x) != 2):
		diagonal_right_tiles.append(Vector2(counter_pos[0]-x, counter_pos[1]+x))
		x += 1
	
	x = 1

	while (tiles.get_cell(counter_pos[0]+x, counter_pos[1]-x) != -1):
		diagonal_right_tiles.append(Vector2(counter_pos[0]+x, counter_pos[1]-x))
		x += 1

	diagonal_right_tiles.sort_custom(array_sorter, "sort")
#	print(diagonal_right_tiles)
	 
	
	for i in diagonal_right_tiles:
#		tiles.set_cellv(i, tile_id)
#		print(i)
		if (tiles.get_cellv(i) == tile_id):
			print(i)
			counters_in_a_row += 1
			winning_counters.append(i)
		elif counters_in_a_row < 4:
			counters_in_a_row = 0
			winning_counters.clear()
#			winning_counters.append(i)
#		print(counters_in_a_row)
	
	if counters_in_a_row >= 4:
		return {"player":player, "counters":winning_counters}
	else:
		return null
	
class array_sorter:
	static func sort(a, b):
		if a[1] < b[1]:
			return true
		return false

func _input(event):
   # Mouse in viewport coordinates.
	if event.is_action_pressed("click") and can_drop:  
		if (mouse_tile_pos[0] >= board_tiles.min()[0]) and (mouse_tile_pos[0] <= board_tiles.max()[0]):
			print("Counter dropped at: ", mouse_tile_pos[0]-board_tiles.min()[0])
			currentCounter = counter.instance()
			add_child(currentCounter)
			currentCounter.get_node("Sprite").texture = current_sprite
			currentCounter.position = tiles.map_to_world(Vector2(mouse_tile_pos[0], (board_tiles.min()[1]-1)))
			get_node("Player"+String(turn)+"Tiles").tile_removed = true
	
	
