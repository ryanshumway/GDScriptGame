class_name TileHighlight
extends Node2D
## A translucent square that marks one tile, like where a crew member is heading.

@export var color := Color(0.3, 0.9, 0.3, 0.35)


func _draw() -> void:
	draw_rect(Rect2(0, 0, Room.TILE_SIZE, Room.TILE_SIZE), color)


## Moves the highlight onto a floorplan tile and makes it visible.
func show_tile(tile: Vector2i) -> void:
	position = Vector2(tile * Room.TILE_SIZE)
	show()
