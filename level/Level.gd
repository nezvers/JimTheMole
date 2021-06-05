extends Node2D

export(PackedScene) var appleScene:PackedScene
export(PackedScene) var moleScene:PackedScene
export(PackedScene) var rubbleScene:PackedScene

onready var holes: = $Holes
onready var mole: = $Mole
onready var apples: = $Apples

var applePos:Array

func _ready()->void:
	applePos = apples.get_children()
	spawn_apple(Vector2.ZERO)
# warning-ignore:return_value_discarded
	Events.connect("enter_hole", self, "enter_hole")
# warning-ignore:return_value_discarded
	Events.connect("hole_exit", self, "hole_exit")
# warning-ignore:return_value_discarded
	Events.connect("ate_fruit", self, "ate_fruit")
# warning-ignore:return_value_discarded
	Events.connect("hole_pressed", self, "hole_pressed")


# warning-ignore:unused_argument
# warning-ignore:unused_argument
func enter_hole(pos:Vector2, areaName:String)->void:
	pass


# warning-ignore:unused_argument
func hole_exit(pos:Vector2)->void:
	pass


# warning-ignore:unused_argument
func ate_fruit(pos:Vector2)->void:
	spawn_apple(Vector2.ZERO)


func hole_pressed(pos:Vector2)->void:
	var inst = moleScene.instance()
	mole.add_child(inst)
	mole.global_position = pos


func spawn_apple(_pos:Vector2)->void:
	var index = randi() % applePos.size()
	var pos:Vector2 = applePos[index].global_position
	var inst = appleScene.instance()
	yield(get_tree(), "idle_frame")
	apples.add_child(inst)
	inst.global_position = pos
