class_name Station
extends Node2D
## A spot in a room where crew work. It has health and shows a health bar.

## Which floorplan tile the station sits on.
@export var grid_position := Vector2i(0, 0)
@export var max_health := 100.0
## Current health. Always kept between 0 and max_health.
@export var health := 40.0:
	set(value):
		health = clampf(value, 0.0, max_health)
		queue_redraw()
@export var color := Color(0.55, 0.45, 0.7)
@export var bar_color := Color(0.3, 0.9, 0.3)
@export var bar_background_color := Color(0.25, 0.1, 0.1)


func _ready() -> void:
	position = Vector2(grid_position * Room.TILE_SIZE)


func _draw() -> void:
	var size := Room.TILE_SIZE
	# The station itself: a square inset a little from the tile's edges.
	draw_rect(Rect2(8, 8, size - 16, size - 16), color)

	# Health bar just above the tile: dark background, then green for the health left.
	var bar_height := 6.0
	var bar_top := -bar_height - 2.0
	draw_rect(Rect2(0, bar_top, size, bar_height), bar_background_color)
	draw_rect(Rect2(0, bar_top, size * health / max_health, bar_height), bar_color)


## True if a floorplan tile is this station's tile.
func has_tile(tile: Vector2i) -> bool:
	return tile == grid_position
