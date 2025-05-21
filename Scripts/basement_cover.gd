extends StaticBody2D

@onready var sprite_2d = $Sprite2D
@export var sprite_img : Texture2D

func _ready():
	sprite_2d.texture = sprite_img


func _on_interactable_body_entered(body):
	pass # Replace with function body.
