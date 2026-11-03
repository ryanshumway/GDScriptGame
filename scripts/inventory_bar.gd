class_name InventoryBar
extends HBoxContainer
## A row of slots along the bottom of the screen that fills up as items are found.

@export var inventory: Inventory
## How many slots to show, found or not.
@export var slot_count := 4

var slots: Array[InventorySlot] = []


func _ready() -> void:
	# Build the empty slots in code, so slot_count can be changed in the Inspector.
	for i in range(slot_count):
		var slot := InventorySlot.new()
		add_child(slot)
		slots.append(slot)

	inventory.changed.connect(refresh)
	refresh()


## Puts each found item in a slot, in order. Slots past the last item are empty.
func refresh() -> void:
	for i in range(slots.size()):
		if i < inventory.items.size():
			slots[i].item = inventory.items[i]
		else:
			slots[i].item = {}
