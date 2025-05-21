extends StaticBody2D

@onready var sprite_2d = $Sprite2D
@export var sprite_img : Texture2D

func _ready():
	sprite_2d.texture = sprite_img
