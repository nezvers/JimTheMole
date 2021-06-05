extends Label

var score: = 0

func _ready()->void:
# warning-ignore:return_value_discarded
	Events.connect("ate_fruit", self, "ate_fruit")


# warning-ignore:unused_argument
func ate_fruit(pos)->void:
	score += 1
	text = "Apples: " + str(score)
