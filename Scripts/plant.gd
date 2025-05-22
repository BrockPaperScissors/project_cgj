class_name Plant extends StaticBody2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var interactable: Area2D = $Interactable
@onready var timer: Timer = $Timer
const SEED_1 = preload("res://Assets/polishedAssets/seed_1.png")
const PLANT_STAGE_1 = preload("res://Assets/polishedAssets/plant_stage_1.png")
const PLANT_STAGE_2 = preload("res://Assets/polishedAssets/plant_stage_2.png")
const PLANT_STAGE_3 = preload("res://Assets/polishedAssets/plant_stage_3.png")
const PLANT_DEAD = preload("res://Assets/polishedAssets/plant_dead.png")

@export var type : String
@export var value : int = 0
@export var depth : int=0
@export var quantity : int = 0
@export var growthLevel : int = 0
@export var waterLevel : int = 0
@export var soilQuality : int = 0
@export var lightExposure : int = 0
@export var plantStages = [SEED_1, PLANT_STAGE_1, PLANT_STAGE_2, PLANT_STAGE_3, PLANT_DEAD]


func _ready():
	interactable.interact = _on_interact
	interactable.isInteractable = false
	quantity = randf_range(0, 4)
	print("Planting quantity: ", quantity)
	

func _on_interact():
	var critChance : float = 0.0
	var critRoll : float = 0.0
	
	if interactable.isInteractable == true:
		quantity = quantity + (round(waterLevel + soilQuality + lightExposure) / 8)
		
		if growthLevel == 1:
			quantity = quantity - 2
			
		elif growthLevel == 2:
			quantity = quantity - 1
			
		elif growthLevel == 3:
			critChance = 0.08
			critRoll = randf_range(0, 1)
			
			if critRoll <= critChance || critRoll >= 1 - critChance:
				amazingGrowth()
				
			else:
				quantity = quantity + 1
		else:
			quantity =  quantity / growthLevel
			
		queue_free()
	
	
	
func startGrowth(soilIn, waterIn, lightIn, typeIn):
	sprite.texture = plantStages[0]
	soilQuality = soilIn
	waterLevel = waterIn
	lightExposure = lightIn
	type = typeIn
	print("Starting to grow")
	
	
func die():
	print("plant has died")
	if growthLevel == 4:
		sprite.texture = plantStages[growthLevel]
		sprite.position.y += 50


func setResources(water, soil, light):
	waterLevel = water
	soilQuality = soil
	lightExposure = light
	
func amazingGrowth():
	print("amazing growth")
	quantity = quantity * 2

func nextStage():
	timer.wait_time = 10 * (growthLevel + 1)

	timer.start()
	sprite.texture = plantStages[growthLevel]

	if growthLevel == 2:
		sprite.position.y -= 75
	elif growthLevel == 3:
		sprite.position.y -= 10

	print("Starting growth level " + str(growthLevel))
	
func _on_timer_timeout():
	print("times up plant")
	interactable.isInteractable = true
	growthLevel += 1

	
	if growthLevel <= 3:
		nextStage()
	else:
		die()
