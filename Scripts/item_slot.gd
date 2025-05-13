extends Control

@onready var icon_rect = $VBoxContainer/TextureRect
@onready var label = $VBoxContainer/Label

func set_item(name: String, texture: Texture2D):
	icon_rect.texture = texture
	label.text = name
	
func _ready():
	self.add_theme_color_override("panel", Color(0.1, 0.1, 0.1, 0.3))
