extends Node

# warning-ignore:unused_signal
signal enter_hole
# warning-ignore:unused_signal
signal hole_pressed
# warning-ignore:unused_signal
signal ate_fruit
# warning-ignore:unused_signal
signal death
# warning-ignore:unused_signal
signal hole_exit

var mole:Node2D = null

func _ready()->void:
	OS.center_window()
