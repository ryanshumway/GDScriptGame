class_name ClueCard
extends CanvasLayer
## A card shown on top of the game when a clue is found. "Got it" closes it.

@onready var description_label: Label = %Description
@onready var close_button: Button = %CloseButton


func _ready() -> void:
	hide()
	close_button.pressed.connect(hide)


## Shows the card with a clue's description.
func show_clue(description: String) -> void:
	description_label.text = description
	show()
