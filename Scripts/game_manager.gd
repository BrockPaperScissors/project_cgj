extends Node2D

@onready var main_menu: Control = $"../MainMenu"
@onready var player = $"../Player"
@onready var player_inventory: PanelContainer = $"../CanvasLayer/playerInventory"
@onready var fridge_inventory: PanelContainer = $"../CanvasLayer/fridgeInventory"
@onready var fridge_animation: AnimatedSprite2D = $"../Fridge/AnimatedSprite2D"
@onready var fridge: StaticBody2D = $"../Fridge"
const SEED_1 = preload("res://Assets/polishedAssets/seed_1.png")

@export var item_list = [{"name": 'Carrots', "quantity": 0, "icon": "res://Assets/UI/icons/plant1.png"}]
@export var player_inv_data = [null, null, null, null, null, null, null, null, null, null, null, null]

var carrotQuant : int = 0

signal inv_item_updated(invSlot, updatedItemInfo)
signal inv_item_added(invSlot, itemInfo, quantity)

func _process(delta):
	if Input.is_action_just_pressed("open_main_menu"):
		toggleMainMenu()
	
	if Input.is_action_just_pressed("open_player_inventory"):
		toggleInventory(player_inventory)
			

func _on_flower_pot_plant_gathered(quantity: Variant, type: Variant) -> void:
	var invIndex = -1

	# Check for item in inventory
	for i in player_inv_data.size():
		if player_inv_data[i] != null:
			if player_inv_data[i].name == type:
				print("item found at position ", i, " carrot count before: ", player_inv_data[i].quantity, " and adding ", quantity)
				player_inv_data[i].quantity += quantity
				print(player_inv_data[i].quantity, " carrots now")
				invIndex = i
				print(player_inv_data[i])
				# Emit inventory item updated signal -- pass in inventory slot, 
				# and item information (includes updated quantity here)
				inv_item_updated.emit((invIndex + 1), player_inv_data[i])
		
	
	# if Item is was not found in inventory already
	if invIndex == -1:
		var openSlot = player_inv_data.find(null)
		
		if openSlot == -1:
			print("Inventory is full")
		else:
			# Get item position from list of items
			var itemIndex = item_list.find(type)
			print("Adding ", type, " to inventory.", quantity, " ", type, " to ", openSlot, " position") 
			# Insert item at first open slot
			player_inv_data[openSlot] = item_list[itemIndex]
			# Set initial quantity of plant gathered
			player_inv_data[openSlot].quantity += quantity
			
			# Emit item added signal -- pass slot position, item details, amount player has in inventory
			inv_item_added.emit((itemIndex + 1), item_list[itemIndex], player_inv_data[openSlot].quantity)
	
	
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
