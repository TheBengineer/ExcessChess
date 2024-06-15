extends Node2D

var photons = []
var observers = []
var board = null
var game_state = null
var moved = null
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func init(board):
	board = board
	game_state = board.game_state2
	pass
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func pos_to_coords(pos):
	var h = int(pos/game_state.height)
	var w = (pos-(h*game_state.height))
	return Vector2(w,h)

func update_state(new_game_state):
	game_state = new_game_state
	update()

			
		
	pass

func add_observer(observer):
	observers.append(observer)

func observe(location):
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	
	pass

func _draw():
	draw_circle(Vector2(0,0), 40, Color.red)
	print("asdfasdf", moved)
	if game_state:
		for piece_id in range(game_state.pieces_state.size()):
			var coords = game_state.pieces_cord[piece_id]
			var piece = game_state.pieces_state[piece_id]
			if piece.has_moved:
				print("moved:", piece, " at ", coords)
				
				moved = pos_to_coords(coords)*65 + Vector2.ONE*32
				draw_circle(moved, 30, Color.blue)
