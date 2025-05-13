extends StaticBody2D

@onready var collision_shape_2d: CollisionShape2D = $Interactable/CollisionShape2D
@onready var interactable: Area2D = $Interactable
@onready var plantScene = preload("res://Scenes/plant.tscn")
@onready var plantContainer = $PlantContainer
@export var waterLevel = 10
@export var soilQuality = 10
@export var lightExposure = 10
@export var planterInventory = [null, null, null]

func _ready():
	interactable.interact = _on_interact
	var screenSize = get_viewport_rect().size
	position  = global_position.clamp(Vector2(0,0), screenSize)
	

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

func removePlant(node):
	var index: int = 0
	index = planterInventory.find(node)
	planterInventory[index] = null


func _on_plant_container_child_exiting_tree(node: Node) -> void:
	removePlant(node)
