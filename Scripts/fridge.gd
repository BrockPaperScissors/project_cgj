extends StaticBody2D

@onready var interactable = $Interactable

func _ready():
	interactable.interact = _on_interact
	
func _on_interact():
	print("open fridge")
	
