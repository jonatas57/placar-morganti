extends Control

@onready var label = $Timer

var time: float = 0
var paused: bool = true

func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	if paused:
		return
	
	time -= delta
	self.set_time(time)

func set_time(time):
	self.time = time
	self.paused = true
	label.text = format_time(time)

func format_time(time: float) -> String:
	var minutes = int(time / 60)
	var seconds = int(time) % 60
	return "%02d:%02d" % [minutes, seconds]
