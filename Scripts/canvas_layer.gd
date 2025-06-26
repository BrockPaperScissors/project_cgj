extends CanvasLayer

func _on_game_manager_inv_item_added(slotNum, itemInfo) -> void:
	# Get inventory slots of updated inventory
	var slots = get_tree().get_nodes_in_group("playerInvSlots")
	print(slotNum, "slot num")

	# Get reference to slot texture and label
	var slotChildren = slots[slotNum].get_children()
	
	# Separate into individual texture/label variables
	var slotTexture = slotChildren[0]
	var slotLabel = slotChildren[1]
	# Load item icon data
	var itemTexture = load(itemInfo.icon)
	
	# Set slot texture to be the loaded item texture
	slotTexture.texture = itemTexture
	slotLabel.text = str(itemInfo.name, " ", "(", itemInfo.quantity, ")")
	slots[slotNum].item = itemInfo


func _on_game_manager_inv_item_updated(invSlot: Variant, updatedItemInfo: Variant) -> void:
	# Get current inventory slots
	var slots = get_tree().get_nodes_in_group("playerInvSlots")
	
	# Access the child components of the slot being updated
	var slotChildren = slots[invSlot].get_children()
	
	# Create reference variables to label component
	var slotLabel = slotChildren[1]
	
	# Update text of label component to be the updated quantity
	slotLabel.text = str(updatedItemInfo.name, " ", "(", updatedItemInfo.quantity, ")")
	slots[invSlot].item = updatedItemInfo
