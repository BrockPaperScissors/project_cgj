extends Control



func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/player.tscn") #brings you to player screen for testing (change to level 0)


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Settings_Menu.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit() #exits program
