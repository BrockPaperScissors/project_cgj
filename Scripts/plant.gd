class_name Plant extends StaticBody2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var interactable: Area2D = $Interactable
@onready var timer: Timer = $Timer

@export var type : String
@export var value : int = 0
@export var depth : int
@export var quantity : int
@export var growthLevel : int
@export var waterLevel : int
@export var soilQuality : int = 0
@export var lightExposure : int = 0


func _ready():
	interactable.interact = _on_interact
	interactable.isInteractable = false
	

func _on_interact():
	if interactable.isInteractable == true:
		print("Plant harvested")
		queue_free()
	
	
	
func startGrowth(soilIn, waterIn, lightIn, typeIn):
	soilQuality = soilIn
	waterLevel = waterIn
	lightExposure = lightIn
	type = typeIn
	print("Starting to grow")
	
	
func die():
	print("plant has died")

func consumeResource():
	if waterLevel > 0:
		waterLevel = waterLevel - 1
	if soilQuality > 0:
		soilQuality = soilQuality - 1

func amazingGrowth():
	pass

func nextStage():
	timer.wait_time = 10 * (growthLevel + 1)
	timer.start()
	print("Starting growth level " + str(growthLevel))
	
func _on_timer_timeout():
	print("times up plant")
	interactable.isInteractable = true
	growthLevel += 1
	
	if growthLevel <= 3:
		nextStage()
		if growthLevel == 3:
			sprite.self_modulate = Color(0, 255, 0, 1)
	else:
		sprite.self_modulate = Color(165, 42, 42, 1)
		die()
