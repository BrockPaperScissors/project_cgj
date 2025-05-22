extends Control

func _ready():
	connect("visibility_changed", _on_visibility_changed)

func _on_visibility_changed():
	var player = get_node("/root/level_0/Player")
