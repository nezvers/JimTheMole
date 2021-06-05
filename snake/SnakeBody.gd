extends Node2D

onready var parent:Node2D = get_parent()

func _ready()->void:
	set_as_toplevel(true)

# warning-ignore:unused_argument
func _process(delta:float):
	var dist:Vector2 = parent.global_position - global_position
	if dist.length() < 1.0:
		return
	rotation = dist.angle()
	global_position = parent.global_position
