extends Control

@onready var playButton = $TimeControls/StartPause
@onready var stopButton = $TimeControls/Stop

var timerInstances: Array[Label] = []

var time: float = 0
var paused: bool = true

func _ready() -> void:
	playButton.connect("pressed", self.pause_resume)
	stopButton.connect("pressed", self.reset)
	timerInstances.append($Timer)

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
	
	var text: String = format_time(time)
	var color: Color = Color.from_string("#00ca00", Color.GREEN)
	if time < 20:
		var parity = int(time) % 2
		if parity == 0:
			color = Color.RED
		else:
			color = Color.YELLOW
	else:
		color = Color.from_string("#00ca00", Color.GREEN)
	
	for label in timerInstances:
		label.text = text
		label.label_settings.font_color = color

func format_time(time: float) -> String:
	var minutes = int(time / 60)
	var seconds = int(time) % 60
	return "%02d:%02d" % [minutes, seconds]

func pause_resume():
	self.paused = !self.paused

func reset():
	self.set_time(0)
