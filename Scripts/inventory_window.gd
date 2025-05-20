extends Control

@onready var grid = $Panel/GridContainer
var SlotScene = preload("res://Scenes/item_slot.tscn")
var items = [
	{"name": "plant1", "icon": preload("res://Assets/UI/icons/plant1.png")},
	{"name": "plant2", "icon": preload("res://Assets/UI/icons/plant2.png")},
	{"name": "plant3", "icon": preload("res://Assets/UI/icons/plant3.png")},
]

func add_item(name: String, icon: Texture):
	var slot = SlotScene.instantiate()
	slot.add_item(name, icon)
	$GridContainer.add_child(slot)

func _ready():
	self.add_theme_color_override("panel", Color(0.1, 0.1, 0.1, 0.3))
	populate_inventory()
	
func populate_inventory():
	for item in items:
		var slot = SlotScene.instantiate()
		grid.add_child(slot)
		slot.set_item(item["name"], item["icon"])
