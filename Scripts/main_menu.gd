extends Control



func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_0.tscn") #brings you to player screen for testing (change to level 0)
	# if player has started the game already and hits play, we dont want it to reset level 0. Just go back to playing
	# Create gameActive bool in gameManager-- 
	# If gameActive == true
		# try something along the lines of self.visiblity == false
	# else:
	#	get_tree().change_scene_to_file("res://Scenes/level_0.tscn")


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Settings_Menu.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit() #exits program
