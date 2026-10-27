class_name Door
extends Node2D
## A single walkable tile that connects two rooms.

## Which floorplan tile the door sits on.
@export var grid_position := Vector2i(0, 0)
@export var color := Color(0.78, 0.6, 0.3)
## Color of the passage around the door.
@export var floor_color := Color(0.36, 0.48, 0.6)
## How wide the door bar is, in pixels. A tile is 48.
@export var door_width := 12.0


func _ready() -> void:
	position = Vector2(grid_position * Room.TILE_SIZE)


func _draw() -> void:
	var size := Room.TILE_SIZE
	draw_rect(Rect2(0, 0, size, size), floor_color)
	draw_rect(Rect2((size - door_width) / 2, 0, door_width, size), color)


## True if a floorplan tile is this door's tile.
func has_tile(tile: Vector2i) -> bool:
	return tile == grid_position