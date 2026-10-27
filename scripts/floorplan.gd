extends Node2D
## Coordinates the rooms and crew: turns the player's clicks into orders.

## How many tiles wide and tall the floorplan is. Must fit every room.
@export var grid_size := Vector2i(11, 5)

## Finds the shortest route between two tiles, going around solid tiles.
var pathfinder := AStarGrid2D.new()

@onready var crew_member: CrewMember = $CrewMember


func _ready() -> void:
	pathfinder.region = Rect2i(Vector2i.ZERO, grid_size)
	pathfinder.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER
	pathfinder.update()
	for x in range(grid_size.x):
		for y in range(grid_size.y):
			var tile := Vector2i(x, y)
			pathfinder.set_point_solid(tile, not is_walkable(tile))


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
		var tile := pixels_to_tile(get_local_mouse_position())
		if is_walkable(tile):
			var path := pathfinder.get_id_path(crew_member.tile_position, tile)
			# The first tile in the path is where the crew member already is.
			crew_member.walk_path(path.slice(1))


## Returns the floorplan tile under a pixel position, measured from the floorplan's top-left.
func pixels_to_tile(pixels: Vector2) -> Vector2i:
	return Vector2i((pixels / Room.TILE_SIZE).floor())


## True if a tile is inside any room or door.
func is_walkable(tile: Vector2i) -> bool:
	for child in get_children():
		if (child is Room or child is Door) and child.has_tile(tile):
			return true
	return false
