extends Node2D

@onready var main_menu: Control = $"../MainMenu"
@onready var player = $"../Player"
@onready var ui_inventory = $"../UiManager/PlayerInventoryWindow"
var isOpen = false
var activeGame = false
	
func _ready():
	activeGame = true
	
func _process(delta):
	if Input.is_action_just_pressed("open_main_menu"):
		if main_menu.visible == true:
			main_menu.visible = false
		else:
			main_menu.visible = true
	
	if Input.is_action_just_pressed("open_player_inventory"):
		ui_inventory.position = getPlayerPos()
		if ui_inventory.visible == true:
			ui_inventory.visible = false
		else:
			ui_inventory.visible = true
			
		



func _on_flower_pot_plant_gathered(quantity: Variant, type: Variant) -> void:
	print("Adding: ", quantity, " ", type)

func toggleInventory():
	ui_inventory.position = getPlayerPos()
	ui_inventory.visible = !(ui_inventory.visible)

func _on_ui_manager_visibility_changed():
	print("Player opened inventory", player)
	
func getPlayerPos():
	var playerPos = player.position
	return playerPos
