class_name Inventory
extends Node
## Everything the team has found, shared by the whole crew.

## Emitted whenever an item is added, so displays can update.
signal changed

## The names of the items found so far, in the order they were found.
var items: Array[String] = []


## Adds an item and lets listeners know.
func add(item: String) -> void:
	items.append(item)
	changed.emit()


## True if the team has found an item with this name.
func has(item: String) -> bool:
	return item in items
