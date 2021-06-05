extends Node2D

export (float) var speed:float = 120.0

onready var targetPos: = global_position

func _process(delta:float)->void:
	if Events.mole:
		targetPos = Events.mole.global_position
	var dist: = targetPos - global_position
	var dir: = dist.normalized()
	
	if dist.length() < speed * delta:
		global_position = targetPos
	else:
		global_position += dir * speed * delta
	rotation = dir.angle()
