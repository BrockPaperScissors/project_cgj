class_name Plant extends StaticBody2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var interactable: Area2D = $Interactable
@onready var timer: Timer = $Timer

signal plant_gathered
#@onready var gameManager = %Game_Manager
@export var type : String
@export var value : int = 0
@export var depth : int
@export var quantity : int
@export var growthLevel : int
@export var waterLevel : int
@export var soilQuality : int = 0


func _ready():
	interactable.interact = _on_interact
	interactable.isInteractable = false
	

func _on_interact():
	if interactable.isInteractable == true:
		plant_gathered.emit()
		print("Plant harvested")
		queue_free()
	
	
	
func startGrowth():
	print("Starting to grow")
	
	
func die():
	pass

func consumeResource():
	if waterLevel > 0:
		waterLevel = waterLevel - 1
	if soilQuality > 0:
		soilQuality = soilQuality - 1

func amazingGrowth():
	pass

func nextStage():
	pass
	
func _on_timer_timeout():
	print("times up plant")
	interactable.isInteractable = true
	sprite.self_modulate = Color(0, 255, 0, 1)
