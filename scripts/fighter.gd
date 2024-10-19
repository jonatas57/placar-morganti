class_name Fighter
extends Node

var score: int = 0
var penaulties: int = 0

var score_displays: Array[Text] = []

func add_score_display(score: Text):
	score_displays.append(score)

func increase_score():
	if score == MatchConfiguration.MAX_FIGHTER_SCORE:
		return
	score += 1
	update_displays()

func decrease_score():
	if score == 0:
		return
	score -= 1
	update_displays()

func give_penalty():
	if penaulties == MatchConfiguration.MAX_FIGHTER_PENAULTIES:
		return
	penaulties += 1

func remove_penaulty():
	if penaulties == 0:
		return
	penaulties += 1

func update_displays():
	for display in score_displays:
		display.set_text("%d" % score)
