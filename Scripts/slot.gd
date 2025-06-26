extends VBoxContainer

@onready var texture_rect: TextureRect = $TextureRect
var item = null

func _on_texture_rect_mouse_entered() -> void:
	self.size_flags_stretch_ratio = 1.1

func _on_texture_rect_mouse_exited() -> void:
	self.size_flags_stretch_ratio = 1.00


func _on_texture_rect_gui_input(event: InputEvent) -> void:
	if (event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT):
		if item != null:
			print("left clicked")
	if (event.is_pressed() and event.button_index == MOUSE_BUTTON_RIGHT):
		if item != null:
			print("right clicked")
	
