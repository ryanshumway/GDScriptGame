class_name CrewMember
extends Node2D
## A crew member, drawn as a circle standing on one tile.

## Which tile the crew member stands on, counted from the top-left tile (0, 0).
@export var tile_position := Vector2i(2, 2)
@export var color := Color(0.93, 0.93, 0.93)
@export var radius := 16.0
## How fast the crew member walks, in pixels per second.
@export var walk_speed := 150.0

## The tiles still to walk through, in order. Empty means standing still.
var path: Array[Vector2i] = []


func _ready() -> void:
	position = tile_to_pixels(tile_position)


func _process(delta: float) -> void:
	# Still between tiles? Keep sliding toward the center of the tile we're entering.
	var tile_center := tile_to_pixels(tile_position)
	if position != tile_center:
		position = position.move_toward(tile_center, walk_speed * delta)
		return

	# Standing on a tile's center. If there's more path, step into the next tile.
	if not path.is_empty():
		tile_position = path.pop_front()


## Orders the crew member to walk through a list of tiles, in order.
func walk_path(new_path: Array[Vector2i]) -> void:
	path = new_path


func _draw() -> void:
	draw_circle(Vector2.ZERO, radius, color)


## Returns the pixel position of the center of a tile.
func tile_to_pixels(tile: Vector2i) -> Vector2:
	var tile_corner := Vector2(tile * Room.TILE_SIZE)
	return tile_corner + Vector2(Room.TILE_SIZE, Room.TILE_SIZE) / 2.0
