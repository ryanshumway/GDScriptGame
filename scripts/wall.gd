class_name Wall
extends Node2D
## A solid block of tiles that crew can't walk through.

## Where the wall's top-left tile sits on the floorplan grid.
@export var grid_position := Vector2i(0, 0)
## How many tiles wide (x) and tall (y) the wall is.
@export var size_in_tiles := Vector2i(1, 1)
@export var color := Color(0.12, 0.13, 0.15)


func _ready() -> void:
	position = Vector2(grid_position * Room.TILE_SIZE)


func _draw() -> void:
	draw_rect(Rect2(Vector2.ZERO, Vector2(size_in_tiles * Room.TILE_SIZE)), color)


## True if a floorplan tile is covered by this wall.
func has_tile(tile: Vector2i) -> bool:
	return Rect2i(grid_position, size_in_tiles).has_point(tile)
