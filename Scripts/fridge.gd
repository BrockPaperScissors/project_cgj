extends StaticBody2D

@onready var interactable = $Interactable
@onready var ext = $"../UiManager/ExternalInventory"
@onready var player := $"../UiManager/PlayerInventory"
@onready var fridge := ext.get_node("Fridge")


func _ready():
	interactable.interact = _on_interact
	
func _on_interact():
	if fridge.visible:
		print("close fridge")
		fridge.visible = false
		ext.visible = false
	else:
		print("open fridge")
		player.visible = false
		ext.visible = true
		fridge.visible = true
		
		
	
