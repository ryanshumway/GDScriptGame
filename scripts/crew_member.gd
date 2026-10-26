class_name CrewMember
extends Node2D
## A crew member, drawn as a circle standing on one tile.

## Which tile the crew member stands on, counted from the top-left tile (0, 0).
@export var tile_position := Vector2i(2, 2)
@export var color := Color(0.93, 0.93, 0.93)
@export var radius := 16.0


func _ready() -> void:
	position = tile_to_pixels(tile_position)


func _draw() -> void:
	draw_circle(Vector2.ZERO, radius, color)


## Returns the pixel position of the center of a tile.
func tile_to_pixels(tile: Vector2i) -> Vector2:
	var tile_corner := Vector2(tile * Room.TILE_SIZE)
	return tile_corner + Vector2(Room.TILE_SIZE, Room.TILE_SIZE) / 2.0
