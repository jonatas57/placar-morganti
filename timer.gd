extends Control

@onready var play_button = $TimeControls/StartPause
@onready var stop_button = $TimeControls/Stop

var timer_instances: Array[Label] = []

var time: float = 0
var paused: bool = true

func _ready() -> void:
	play_button.connect("pressed", self.pause_resume)
	stop_button.connect("pressed", self.reset)
	timer_instances.append($Timer)

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
	
	for label in timer_instances:
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
