extends Control

@onready var timer = $TimerArea
@onready var time_buttons = $TimerArea/TimeButtons
@onready var display_button = $Button
@onready var display_window: Window = $DisplayWindow

var display_screen = preload("res://scenes/display.tscn")


func _ready() -> void:
	for button in time_buttons.get_children():
		button.connect('button_down', func (): timer.set_time(button.get_meta('value', 0)))

	display_button.connect("pressed", self.toggle_display_screen)
	
	var display_instance = display_screen.instantiate()
	display_window.add_child(display_instance)
	display_window.connect("close_requested", self.toggle_display_screen)
	
	timer.timer_instances.append(display_instance.timer_label)

func toggle_display_screen():
	if display_window.is_visible():
		display_window.hide()
	else:
		display_window.show()
