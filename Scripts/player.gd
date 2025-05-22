extends CharacterBody2D
class_name Player

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@export var nearestItem = null
@export var inRange = false
@export var speed = 400
@export var currAnimation = ""
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var previousDir = 1

func _physics_process(delta):
	velocity = Vector2(0, 0)
	
	if is_on_floor() == false:
		velocity.y += gravity * delta * 12
	
	var moveDirection = Input.get_axis("move_left", "move_right")
	velocity.x = moveDirection * speed
	
	if moveDirection == -1:
		animated_sprite_2d.play("move_left")
		previousDir = -1
	if moveDirection == 1:
		animated_sprite_2d.play("move_right")
		previousDir = 1
		
	if moveDirection == 0.0:
		if previousDir == -1:
			animated_sprite_2d.play("idle_left")
		if previousDir == 1:
			animated_sprite_2d.play("idle_right")
	
		
	var screen_size = get_viewport_rect().size
	global_position = global_position.clamp(Vector2(0, 0), screen_size)

	move_and_slide()

func playInteractAnimation():
	if previousDir == 0:
		animated_sprite_2d.play("interact_left")
	if previousDir == 1:
		animated_sprite_2d.play("interact_right")
		
		
		
	
