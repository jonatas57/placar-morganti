extends Control

@export var timer_label: Label

@export var redScore: Label
@export var whiteScore: Label


func _ready() -> void:
	$Container.add_theme_constant_override("separation", 0)
	$Container/TopRow.add_theme_constant_override("separation", 0)
