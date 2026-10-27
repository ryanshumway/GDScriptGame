extends Node2D
## Coordinates the rooms and crew: turns the player's clicks into orders.

@onready var room: Room = $Room
@onready var crew_member: CrewMember = $CrewMember


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
		var tile := room.pixels_to_tile(room.get_local_mouse_position())
		if room.has_tile(tile):
			crew_member.walk_to(tile)
