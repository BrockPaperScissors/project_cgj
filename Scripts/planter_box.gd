extends StaticBody2D

@onready var interactable: Area2D = $Interactable
@onready var plantScene = preload("res://Scenes/plant.tscn")
@onready var plantContainer = $PlantContainer
@export var waterLevel = 10
@export var soilQuality = 10
@export var lightExposure = 10
@export var planterCapacity = 0
@export var planterInventory = []

signal plantGathered(quantity, type)

func _ready():
	interactable.interact = _on_interact
	
	for slot in planterCapacity:
		planterInventory.push_back(null)
		#print(planterInventory)
	

func _on_interact():
	addPlant()

func addPlant():
	var index: int = 0
	index = planterInventory.find(null)
		
	if index != -1:
		var plant_instance = plantScene.instantiate()
		plant_instance.name = "Plant_" + str(index)
		planterInventory[index] = plant_instance
		plantContainer.add_child(plant_instance)
		
		if index == 0:
			planterInventory[0].position.x = int(plant_instance.position.x)
		if index == 1:
			planterInventory[1].position.x = int(plant_instance.position.x + 40)
		if index == 2:
			planterInventory[2].position.x = int(plant_instance.position.x - 40)
			
		plant_instance.startGrowth(soilQuality, waterLevel, lightExposure, "Carrot")
	
		if planterInventory.find(null) == -1:
			interactable.isInteractable = false

func removePlant(node):
	interactable.interactName = "Plant Seed"
	var index: int = 0
	index = planterInventory.find(node)
	planterInventory[index] = null
	interactable.isInteractable = true


func _on_plant_container_child_exiting_tree(node: Node) -> void:
	if node is Plant:
		plantGathered.emit(node.quantity, node.type)
		removePlant(node)
		consumeResource()


func _on_plant_container_child_entered_tree(node: Node) -> void:
	if node is Plant:
		node.setResources(waterLevel, soilQuality, lightExposure)
		

func consumeResource():
	if waterLevel > 0:
		waterLevel = waterLevel - 1
	if soilQuality > 0:
		soilQuality = soilQuality - 1
	if lightExposure > 0: 
		lightExposure = lightExposure - 1
