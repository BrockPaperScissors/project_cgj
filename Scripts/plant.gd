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
	

func _on_interact():
	# RNG - Special harvest
	var critChance : float = 0.0
	var critRoll : float = 0.0
	
	if interactable.isInteractable == true:
		# Determine somewhat random quantity based on 
		# water levels, soil qualities, and light exposure
		quantity = quantity + (round(waterLevel + soilQuality + lightExposure) / 8)
		
		# If gathered at plant stage 1 - player gets less
		if growthLevel == 1:
			quantity = quantity - 2
			
		# If gathered at plant stage 2 - player gets slightly less
		elif growthLevel == 2:
			quantity = quantity - 1
		
		# If gathered at plant stage 3 - player gets full amount and has
		# chance to double quantity
		elif growthLevel == 3:
			critChance = 0.08
			critRoll = randf_range(0, 1)
			
			# If crit crit roll is between
			# 0.00 - 0.08 or 0.92 - 1
			if critRoll <= critChance || critRoll >= 1 - critChance:
				amazingGrowth()
				
			else:
				# If not a crit roll, quantity just increases by 1
				quantity = quantity + 1
		else:
			# Plant has died, quantity reduced by growth level (4)
			quantity =  quantity / growthLevel
			
		# Remove plant from scene
		queue_free()
	
	
	# Start growing the plant -- 
	# set starting sprite to intial growth image
	# set resource values of this specific plant
	# set the plant type.
func startGrowth(soilIn, waterIn, lightIn, typeIn):
	sprite.texture = plantStages[0]
	soilQuality = soilIn
	waterLevel = waterIn
	lightExposure = lightIn
	type = typeIn
	
	
# Show plant has died sprite
func die():
	if growthLevel == 4:
		sprite.texture = plantStages[growthLevel]
		sprite.position.y += 50

# Set the water level, soil, and light exposure of planter box
func setResources(water, soil, light):
	waterLevel = water
	soilQuality = soil
	lightExposure = light
	
	# Doubles quantity yield
func amazingGrowth():
	quantity = quantity * 2

	# Advances plant growth to the next stage
func nextStage():
	# Starts a timer -- length based on growth stage
	timer.wait_time = 10 * (growthLevel + 1)
	timer.start()
	# Update the plant visually based on the stage of growth
	sprite.texture = plantStages[growthLevel]

	# Manual offsets to make the different sprite positions match
	if growthLevel == 2:
		sprite.position.y -= 75
	elif growthLevel == 3:
		sprite.position.y -= 10

# Plant growth reaches the next stage	
func _on_timer_timeout():
	print("times up plant")
	# Plant can now be gathered
	interactable.isInteractable = true
	
	# Move growth to the next stage
	growthLevel += 1

	# If the plant is still alive, start a new timer, update visual
	if growthLevel <= 3:
		nextStage()
	else:
	# Else plant dies
		die()
