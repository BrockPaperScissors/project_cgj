extends StaticBody2D

@onready var interactable: Area2D = $Interactable
@onready var plantScene = preload("res://Scenes/plant.tscn")
@onready var plantContainer = $PlantContainer
@export var waterLevel = 0
@export var soilQuality = 0
@export var currentPlants = 0

func _ready():
	interactable.interact = _on_interact
	
func _on_interact():
	addPlant()

func addPlant():
	if currentPlants != 3:
		var plant_instance = plantScene.instantiate()
		plantContainer.add_child(plant_instance)
		plant_instance.startGrowth()
		currentPlants += 1

func removePlant():
	pass
