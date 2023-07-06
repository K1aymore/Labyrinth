extends Node

class_name Tile

const TILESIZE = 60


var type := TYPE.STRAIGHT
var color := COLOR.NONE

var isSpare := false

var pos := Vector2.ZERO
var rot : int

enum TYPE {
	STRAIGHT,
	TSHAPE,
	CORNER,
}

enum ITEMS {
	BAT,
	BOMB,
	BOOK,
	BUG,
	CANDLES,
	CANNON,
	CAT,
	COINS,
	CROWN,
	DAGGER,
	DIAMOND,
	DINOSAUR,
	GHOST,
	GRAIL,
	HELMET,
	KEYS,
	LIZARD,
	MERMAID,
	MOUSE,
	OWL,
	PONY,
	POTION,
	RING,
	TREASURE,
}

enum COLOR {
	NONE,
	BLUE,
	RED,
	YELLOW,
	GREEN,
}




func push(dir : Vector2):
	pos += dir.snapped(Vector2.ONE)


func canMoveThrough(dir : Vector2) -> bool:
	dir = dir.rotated(deg_to_rad(rot))
	
	match type:
		TYPE.STRAIGHT:
			return moveNorth(dir) || moveSouth(dir)
		TYPE.TSHAPE:
			return moveNorth(dir) || moveEast(dir) || moveSouth(dir)
		TYPE.CORNER:
			return moveNorth(dir) || moveEast(dir)
		_:
			return false



func moveNorth(dir : Vector2):
	return dir.snapped(Vector2.ONE).is_equal_approx(Vector2(0, -1))
func moveSouth(dir : Vector2):
	return dir.snapped(Vector2.ONE).is_equal_approx(Vector2(0, 1))
func moveEast(dir : Vector2):
	return dir.snapped(Vector2.ONE).is_equal_approx(Vector2(1, 0))
func moveWest(dir : Vector2):
	return dir.snapped(Vector2.ONE).is_equal_approx(Vector2(-1, 0))