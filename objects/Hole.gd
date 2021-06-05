extends Area2D


onready var sprite: = $Sprite


func _ready()->void:
	set_process_unhandled_input(false)
# warning-ignore:return_value_discarded
	Events.connect("enter_hole", self, "enter_hole")
# warning-ignore:return_value_discarded
	Events.connect("hole_pressed", self, "hole_pressed")
# warning-ignore:return_value_discarded
	Events.connect("hole_exit", self, "hole_exit")


# warning-ignore:unused_argument
func enter_hole(pos:Vector2, areaName:String)->void:
	if areaName != name:
		sprite.frame = 2
		set_process_unhandled_input(true)

# warning-ignore:unused_argument
func hole_pressed(pos:Vector2)->void:
	sprite.frame = 0
	set_process_unhandled_input(false)
	


func _unhandled_input(event:InputEvent)->void:
	if event.is_action_pressed("click"):
		var dist: = get_local_mouse_position().length()
		if dist < 30:
			Events.emit_signal("hole_pressed", global_position)
			
