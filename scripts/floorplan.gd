extends Node2D
## Coordinates the rooms and crew: turns the player's clicks into orders.

## How many tiles wide and tall the floorplan is. Must fit every room.
@export var grid_size := Vector2i(11, 5)

## Finds the shortest route between two tiles, going around solid tiles.
var pathfinder := AStarGrid2D.new()

## The crew member that right-clicks will move. Null when nobody is selected.
var selected_crew: CrewMember = null


func _ready() -> void:
	pathfinder.region = Rect2i(Vector2i.ZERO, grid_size)
	pathfinder.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER
	pathfinder.update()
	for x in range(grid_size.x):
		for y in range(grid_size.y):
			var tile := Vector2i(x, y)
			pathfinder.set_point_solid(tile, not is_walkable(tile))


func _unhandled_input(event: InputEvent) -> void:
	if not (event is InputEventMouseButton and event.pressed):
		return

	var mouse := get_local_mouse_position()
	if event.button_index == MOUSE_BUTTON_LEFT:
		select_crew(crew_at_point(mouse))
	elif event.button_index == MOUSE_BUTTON_RIGHT and selected_crew != null:
		var tile := pixels_to_tile(mouse)
		if is_walkable(tile):
			var path := pathfinder.get_id_path(selected_crew.tile_position, tile)
			# The first tile in the path is where the crew member already is.
			selected_crew.walk_path(path.slice(1))


## Selects a crew member, or nobody if given null. Deselects the previous one.
func select_crew(crew: CrewMember) -> void:
	if selected_crew != null:
		selected_crew.is_selected = false
	selected_crew = crew
	if selected_crew != null:
		selected_crew.is_selected = true


## Returns the crew member whose circle contains a point, or null if none does.
func crew_at_point(point: Vector2) -> CrewMember:
	for child in get_children():
		if child is CrewMember and child.position.distance_to(point) <= child.radius:
			return child
	return null


## Returns the floorplan tile under a pixel position, measured from the floorplan's top-left.
func pixels_to_tile(pixels: Vector2) -> Vector2i:
	return Vector2i((pixels / Room.TILE_SIZE).floor())


## True if a tile is inside any room or door.
func is_walkable(tile: Vector2i) -> bool:
	for child in get_children():
		if (child is Room or child is Door) and child.has_tile(tile):
			return true
	return false
