class_name ClueCard
extends CanvasLayer
## A card shown on top of the game when a clue is found. The game pauses
## while it's open, and "Got it" closes it.

## How long the card takes to fade and slide in, in seconds.
@export var appear_time := 0.25
## How far below its resting place the card starts, in pixels.
@export var slide_distance := 30.0

@onready var panel: PanelContainer = $Panel
@onready var description_label: Label = %Description
@onready var close_button: Button = %CloseButton


func _ready() -> void:
	hide()
	close_button.pressed.connect(close)


## Shows the card with a clue's description and pauses the game.
func show_clue(description: String) -> void:
	description_label.text = description
	get_tree().paused = true
	show()

	# Start invisible and a little low...
	panel.modulate.a = 0.0
	offset = Vector2(0, slide_distance)
	# ...then fade in and slide up, both at once.
	var tween := create_tween().set_parallel()
	tween.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(panel, "modulate:a", 1.0, appear_time)
	tween.tween_property(self, "offset", Vector2.ZERO, appear_time)


## Hides the card and unpauses the game.
func close() -> void:
	hide()
	get_tree().paused = false
