extends Node2D

@onready var interactLabel: Label = $InteractLabel
var interactions = []
var inRange = true

func _input(event: InputEvent):
	if event.is_action_pressed("interact") and inRange:
		if interactions:
			inRange = false
			interactLabel.hide()
			await interactions[0].interact.call()
			inRange = true
			
			
func _process(_delta):
	if interactions and inRange:
		interactions.sort_custom(_sort_by_distance)
		if interactions[0].isInteractable:
			if !(interactions[0].isLore):
				interactLabel.text = "[f] " + interactions[0].interactName
			else:
				interactLabel.text = interactions[0].interactName
				
			interactLabel.show()
	else:
		interactLabel.hide()
		
func _sort_by_distance(area1, area2):
	var area1Distance = global_position.distance_to(area1.global_position)
	var area2Distance = global_position.distance_to(area2.global_position)
	return area1Distance < area2Distance
	
func _on_interact_range_area_entered(area: Area2D) -> void:
	interactions.push_back(area)
	

func _on_interact_range_area_exited(area: Area2D) -> void:
	interactions.erase(area)
