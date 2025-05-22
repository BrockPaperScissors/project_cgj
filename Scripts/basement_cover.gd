extends StaticBody2D

@onready var sprite_2d = $Sprite2D
@onready var interactable = $Interactable
@export var sprite_img : Texture2D


func _ready():
	interactable.interact = _on_interact
	sprite_2d.texture = sprite_img


func _on_interactable_body_entered(body):
	pass # Replace with function body.

func _on_interact():
	print("floor boards")
