class_name Room
extends Node2D
## A rectangular room drawn as a grid of square tiles.

## Width and height of one tile, in pixels. Shared by everything that
## needs to convert between tiles and pixels.
const TILE_SIZE := 48

## Where the room's top-left tile sits on the floorplan grid.
@export var grid_position := Vector2i(0, 0)
## How many tiles wide (x) and tall (y) the room is.
@export var size_in_tiles := Vector2i(5, 5)
@export var floor_color := Color(0.36, 0.48, 0.6)
@export var grid_line_color := Color(0.2, 0.27, 0.35)


func _ready() -> void:
	position = Vector2(grid_position * TILE_SIZE)


func _draw() -> void:
	for x in range(size_in_tiles.x):
		for y in range(size_in_tiles.y):
			var tile_rect := Rect2(x * TILE_SIZE, y * TILE_SIZE, TILE_SIZE, TILE_SIZE)
			draw_rect(tile_rect, floor_color)
			draw_rect(tile_rect, grid_line_color, false, 2.0)


## True if a floorplan tile is inside this room.
func has_tile(tile: Vector2i) -> bool:
	return Rect2i(grid_position, size_in_tiles).has_point(tile)
