extends Control

@onready var label = $Timer
@onready var playButton = $TimeControls/StartPause
@onready var stopButton = $TimeControls/Stop

var time: float = 0
var paused: bool = true

func _ready() -> void:
	playButton.connect("pressed", self.pause_resume)
	stopButton.connect("pressed", self.reset)

func _process(delta: float) -> void:
	if self.paused:
		return
	
	time -= delta
	if time < 0:
		time = 0
		self.paused = true
	self.set_time(time, false)

func set_time(time, pause_time = true):
	self.time = time
	if pause_time:
		self.paused = true
	
	if time < 20:
		var parity = int(time) % 2
		if parity == 0:
			label.label_settings.font_color = Color.RED
		else:
			label.label_settings.font_color = Color.YELLOW
	else:
		label.label_settings.font_color = Color.from_string("#00ca00", Color.GREEN)
	
	label.text = format_time(time)

func format_time(time: float) -> String:
	var minutes = int(time / 60)
	var seconds = int(time) % 60
	return "%02d:%02d" % [minutes, seconds]

func pause_resume():
	self.paused = !self.paused

func reset():
	self.set_time(0)
