extends Node2D

@onready var main_menu: Control = $"../MainMenu"
@onready var player = $"../Player"
#@onready var ui_inventory = $"../UiManager/PlayerInventoryWindow"
@onready var player_inventory: PanelContainer = $"../CanvasLayer/playerInventory"
@onready var fridge_inventory: PanelContainer = $"../CanvasLayer/fridgeInventory"
@onready var fridge_animation: AnimatedSprite2D = $"../Fridge/AnimatedSprite2D"
@onready var fridge: StaticBody2D = $"../Fridge"
const SEED_1 = preload("res://Assets/polishedAssets/seed_1.png")

@export var item_list = [{"name": 'Carrots', "icon": preload("res://Assets/UI/icons/plant1.png")}]

var carrotQuant : int = 0

func _process(delta):
	if Input.is_action_just_pressed("open_main_menu"):
		toggleMainMenu()
	
	if Input.is_action_just_pressed("open_player_inventory"):
		toggleInventory(player_inventory)
			

func _on_flower_pot_plant_gathered(quantity: Variant, type: Variant) -> void:
	print("Adding: ", quantity, " ", type)
	carrotQuant = carrotQuant + quantity
	print(str(carrotQuant) + " Carrots")
	fridge_inventory.add_item('carrot', SEED_1)
	
func toggleInventory(inventory : PanelContainer):
	#canvas_layer.position = getPlayerPos()
	inventory.visible = !(inventory.visible)
	
func toggleMainMenu():
	main_menu.visible = !(main_menu.visible)
	
func getPlayerPos():
	var playerPos = player.position
	return playerPos


func _on_fridge_fridge_opened() -> void:
	fridge_inventory.position = fridge.position
	toggleInventory(fridge_inventory)

func _on_fridge_fridge_closed() -> void:
	#toggleInventory(fridge_inventory)
	pass
