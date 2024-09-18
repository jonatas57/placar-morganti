extends Control

@onready var timer = $TimerArea
@onready var timeButtons = $TimerArea/HBoxContainer

func _ready() -> void:
	for button in timeButtons.get_children():
		button.connect('button_down', func (): timer.set_time(button.get_meta('value', 0)))
