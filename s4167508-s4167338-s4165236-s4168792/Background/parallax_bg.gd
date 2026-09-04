extends Node2D

@onready var parallex_background: ParallaxBackground = $ParallaxBackground

const SCROLL_SPEED : float = -150.0

func _process(delta: float):
	parallex_background.scroll_offset.y -= delta * SCROLL_SPEED
