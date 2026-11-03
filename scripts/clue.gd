class_name Clue
extends Node2D
## Something hidden in a room. A crew member who steps on it finds it.

## Emitted when the clue is found, carrying what the player learns.
signal found(description: String)

## Which floorplan tile the clue sits on.
@export var grid_position := Vector2i(0, 0)
## What the player learns when the clue is found.
@export_multiline var description := "You found a clue!"
@export var color := Color(0.95, 0.8, 0.25)


func _ready() -> void:
	position = Vector2(grid_position * Room.TILE_SIZE)


func _draw() -> void:
	# A small diamond in the middle of the tile.
	var center := Room.TILE_SIZE / 2.0
	var half := 10.0
	var points := PackedVector2Array([
		Vector2(center, center - half),
		Vector2(center + half, center),
		Vector2(center, center + half),
		Vector2(center - half, center),
	])
	draw_colored_polygon(points, color)


## True if a floorplan tile is this clue's tile.
func has_tile(tile: Vector2i) -> bool:
	return tile == grid_position


## Called when a crew member steps on the clue: announce it, then remove it from the game.
func find() -> void:
	found.emit(description)
	queue_free()
