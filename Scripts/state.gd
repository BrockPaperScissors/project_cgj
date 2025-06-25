# Thanks to Jason McCollum 
# https://shaggydev.com/2023/10/08/godot-4-state-machines/
# For clear and concise lesson on state machines

class_name State
extends Node

@export var animation_name: String
@export var move_speed: float = 400
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


var parent: Player

func enter() -> void:
	parent.animated_sprite_2d.play(animation_name)

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	return null

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	return null
