class_name Fighter
extends Node

var score: int = 0
var faults: int = 0

var labels: Array[Label] = []

func addLabel(label: Label):
	labels.append(label)

func increaseScore():
	if score == MatchConfiguration.MAX_FIGHTER_SCORE:
		return
	score += 1
	updateLabels()

func decreaseScore():
	if score == 0:
		return
	score -= 1
	updateLabels()

func giveFault():
	if faults == MatchConfiguration.MAX_FIGHTER_FAULTS:
		return
	faults += 1

func removeFault():
	if faults == 0:
		return
	faults += 1

func updateLabels():
	for label in labels:
		label.text = "%d" % score
