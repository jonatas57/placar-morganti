extends Control

@onready var timer = $TimerArea
@onready var time_buttons = $TimerArea/TimeButtons
@onready var display_button = $Button
@onready var display_window: Window = $DisplayWindow

var display_screen = preload("res://scenes/display.tscn")
var Fighter = preload("res://scripts/fighter.gd")

var display
var redFighter: Fighter
var whiteFigther: Fighter

func _ready() -> void:
	self.setupDisplayScreen()
	self.setupFighters()
	self.setupTimerButtons()

func setupFighters():
	self.redFighter = Fighter.new()
	self.redFighter.addLabel(display.redScore)
	$IncreaseRedScore.connect("pressed", func (): self.redFighter.increaseScore())
	self.whiteFigther = Fighter.new()
	self.whiteFigther.addLabel((display.whiteScore))
	$IncreaseWhiteScore.connect("pressed", func (): self.whiteFigther.increaseScore())

func setupTimerButtons():
	for button in time_buttons.get_children():
		button.connect('button_down', func (): timer.set_time(button.get_meta('value', 0)))

func setupDisplayScreen():
	display_button.connect("pressed", self.toggle_display_screen)
	self.display = display_screen.instantiate()
	display_window.add_child(self.display)
	display_window.connect("close_requested", self.toggle_display_screen)
	timer.timer_instances.append(self.display.timer_label)

func toggle_display_screen():
	if display_window.is_visible():
		display_window.hide()
	else:
		display_window.show()
