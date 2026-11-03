class_name Inventory
extends Node
## Everything the team has found, shared by the whole crew.

## Emitted whenever an item is added, so displays can update.
signal changed

## The items found so far, in order. Each is a dictionary like
## { "name": "Old key", "color": Color(...) }.
var items: Array[Dictionary] = []


## Adds an item and lets listeners know.
func add(item_name: String, color: Color) -> void:
	items.append({ "name": item_name, "color": color })
	changed.emit()


## True if the team has found an item with this name.
func has(item_name: String) -> bool:
	for item in items:
		if item["name"] == item_name:
			return true
	return false
