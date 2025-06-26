extends StaticBody2D

@onready var fridge_inventory: PanelContainer = $"../CanvasLayer/fridgeInventory"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var interactable = $Interactable
var isOpen : bool = false

signal fridgeOpened
signal fridgeClosed

var fridgeOpen : bool = false

func _ready():
	interactable.interact = _on_interact
	
	
func _on_interact():	
	# If fridge is already open -- close it
	if isOpen == true:
		animated_sprite_2d.play("fridge_close")
		fridge_inventory.visible = false
	# If fridge is not open yet -- open it
	else:
		animated_sprite_2d.visible = true
		animated_sprite_2d.play("fridge_open")
		
	# Closed fridge now open || Open fridge now closed
	isOpen = !isOpen



func _on_animated_sprite_2d_animation_finished() -> void:
	# If fridge is closed now -- emit closed signal and hide
	if isOpen == false:
		fridgeClosed.emit()
		animated_sprite_2d.visible = false
	# If fridge is open -- emit open signal and remain visible
	elif isOpen == true:
		fridgeOpened.emit()
