extends Node2D
## Coordinates the rooms and crew: turns the player's clicks into orders.

@onready var crew_member: CrewMember = $CrewMember


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
		var tile := pixels_to_tile(get_local_mouse_position())
		if is_walkable(tile):
			crew_member.walk_to(tile)


## Returns the floorplan tile under a pixel position, measured from the floorplan's top-left.
func pixels_to_tile(pixels: Vector2) -> Vector2i:
	return Vector2i((pixels / Room.TILE_SIZE).floor())


## True if a tile is inside any room or door.
func is_walkable(tile: Vector2i) -> bool:
	for child in get_children():
		if (child is Room or child is Door) and child.has_tile(tile):
			return true
	return false
