extends Button

func _ready()->void:
# warning-ignore:return_value_discarded
	Events.connect("death", self, "death")
	visible = false


# warning-ignore:unused_argument
func death(pos)->void:
	visible = true

func _pressed()->void:
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()
