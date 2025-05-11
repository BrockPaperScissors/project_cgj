extends Node2D

@onready var plantScene = preload("res://Scenes/plant.tscn")
@export var menuOptions = []

var player = null

func _ready():
	player = get_tree().get_first_node_in_group("player")

func _input(event):
	if event.is_action_pressed("interact"):
		print("Interacting with ", player.nearestItem)
		
