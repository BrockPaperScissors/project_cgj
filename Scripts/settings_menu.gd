extends Control



func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Main_Menu.tscn") #brings to main menu


func _on_master_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),linear_to_db(value))


func _on_music_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"),linear_to_db(value))


func _on_effects_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"),linear_to_db(value))
