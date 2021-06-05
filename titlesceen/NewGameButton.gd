extends Button

export(String, FILE) var newGameFile:String

func _pressed()->void:
# warning-ignore:return_value_discarded
	get_tree().change_scene(newGameFile)
