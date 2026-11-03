class_name InventorySlot
extends Control
## One square in the inventory bar. Empty, or showing an item's icon.

@export var background_color := Color(0.1, 0.12, 0.16, 0.85)
@export var border_color := Color(0.4, 0.45, 0.55)

## The item shown here, or an empty dictionary for an empty slot.
var item: Dictionary = {}:
	set(value):
		item = value
		# Hovering a filled slot shows the item's name.
		tooltip_text = item.get("name", "")
		queue_redraw()


func _init() -> void:
	custom_minimum_size = Vector2(56, 56)


func _draw() -> void:
	var rect := Rect2(Vector2.ZERO, size)
	draw_rect(rect, background_color)
	draw_rect(rect, border_color, false, 2.0)

	if item.is_empty():
		return

	# Placeholder icon: a diamond in the item's color, like the clue in the world.
	var center := size / 2.0
	var half := 14.0
	var points := PackedVector2Array([
		center + Vector2(0, -half),
		center + Vector2(half, 0),
		center + Vector2(0, half),
		center + Vector2(-half, 0),
	])
	draw_colored_polygon(points, item["color"])
