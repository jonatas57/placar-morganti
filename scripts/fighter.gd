class_name Fighter
extends Node

var score: int = 0
var faults: int = 0

var labels: Array[Label] = []

func addLabel(label: Label):
	labels.append(label)

func increaseScore():
	score += 1
	updateLabels()

func decreaseScore():
	score -= 1
	updateLabels()

func giveFault():
	faults += 1

func removeFault():
	faults += 1

func updateLabels():
	for label in labels:
		label.text = "%d" % score
