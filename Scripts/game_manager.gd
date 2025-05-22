extends Node2D

@onready var main_menu: Control = $"../MainMenu"
@onready var player = $"../Player"
@onready var ui = $"../UiManager"
#@onready var player_inventory = ui.get_node("PlayerInventory")


var carrotQuant : int = 0
	
func _process(delta):
	if Input.is_action_just_pressed("open_main_menu"):
		main_menu.visible = not main_menu.visible
		if main_menu.visible == true:
			ui.visible = false
			player.visible = false
		else:
			ui.visible = true
			player.visible = true
		
	#if Input.is_action_just_pressed("open_player_inventory"):
		#if not ui.get_node("ExternalInventory").visible and not main_menu.visible:
			#player_inventory.position = getPlayerPos()
			#player_inventory.visible = not player_inventory.visible
			

func _on_flower_pot_plant_gathered(quantity: Variant, type: Variant) -> void:
	print("Adding: ", quantity, " ", type)
	carrotQuant = carrotQuant + quantity
	print(str(carrotQuant) + " Carrots")
	
func toggleInventory():
	#player_inventory.position = getPlayerPos()
	#player_inventory.visible = not player_inventory.visible
	pass

	
func getPlayerPos():
	var playerPos = player.position
	return playerPos
