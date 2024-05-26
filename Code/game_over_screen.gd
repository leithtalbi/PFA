extends CanvasLayer



func _on_restart_button_pressed():
	# TODO: update with regards to level
	Globals.level_started = false
	get_tree().change_scene_to_file("res://Levels/Level1.tscn")


func _on_quit_button_pressed():
	get_tree().quit()
