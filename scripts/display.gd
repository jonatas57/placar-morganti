extends Control

@onready var timer_display: Text = $Container/BottomRow/Timer

@onready var redScore: Text = $Container/TopRow/ColorRect/RedScore
@onready var whiteScore: Text = $Container/TopRow/ColorRect3/WhiteScore

func _ready() -> void:
	$Container.add_theme_constant_override("separation", 0)
	$Container/TopRow.add_theme_constant_override("separation", 0)
	
	redScore.set_text("0")
	redScore.set_text_color(Color.WHITE)
	
	whiteScore.set_text("0")
	whiteScore.set_text_color(Color.BLACK)
