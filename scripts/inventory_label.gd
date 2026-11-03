class_name InventoryLabel
extends Label
## Shows the inventory's items as one line of text, kept up to date.

@export var inventory: Inventory


func _ready() -> void:
	inventory.changed.connect(refresh)
	refresh()


## Rewrites the text from the inventory's current items.
func refresh() -> void:
	if inventory.items.is_empty():
		text = "Found: nothing yet"
	else:
		text = "Found: " + ", ".join(inventory.items)
