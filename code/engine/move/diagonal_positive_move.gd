# DiagonalPositiveMove contains the logic for a move in the positive diagonal (down-right).


const linear = preload("res://engine/move/linear_move.gd")


# Properties
var name


func _init(name_):
	name = name_

# Validates a line of spaces and adds valid spaces to the list of positions.
# Arguments:
# positions: The array of positions.
# game: The game state information.
# pos: The original position of the piece.
# piece: The selected piece's state information.
func add_pos(positions, game, pos, piece):
	var start: int
	var end: int
	var file = pos % game.width
	var rank = pos / game.width
	# Check spaces down-right from origin.
	start = pos + game.width + 1
	end = pos + 1 + (game.width + 1) * (round(min(game.width - file, game.height - rank)) - 1)
	if start < end:
		linear.add_pos_linear(positions, start, end, game.width + 1,
				game.max_pos, piece.team, game.pieces)
	# Check spaces up-left from origin.
	start = pos - game.width - 1
	end = pos - 1 - (game.width + 1) * (round(min(rank, file)))
	if start > end:
		linear.add_pos_linear(positions, start, end, -game.width - 1,
				game.max_pos, piece.team, game.pieces)