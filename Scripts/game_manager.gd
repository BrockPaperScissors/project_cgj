extends Node2D

@onready var main_menu: Control = $"../MainMenu"

func _process(delta):
	if Input.is_action_just_pressed("open_main_menu"):
		main_menu.visible = true


func _on_flower_pot_plant_gathered(quantity: Variant, type: Variant) -> void:
	print("Adding: ", quantity, " ", type)
