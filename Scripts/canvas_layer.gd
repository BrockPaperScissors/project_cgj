extends CanvasLayer

func _on_game_manager_inv_item_added(slotNum, itemInfo, quantity) -> void:
	# Get inventory slots of updated inventory
	var slots = get_tree().get_nodes_in_group("playerInvSlots")
	# Get reference to slot texture and label
	var slotChildren = slots[slotNum].get_children()
	
	# Separate into individual texture/label variables
	var slotTexture = slotChildren[0]
	var slotLabel = slotChildren[1]
	# Load item icon data
	var itemTexture = load(itemInfo.icon)
	
	# Set slot texture to be the loaded item texture
	slotTexture.texture = itemTexture
	slotLabel.text = str(itemInfo.name, " ", "(", quantity, ")")
