extends CharacterBody2D
class_name Player

@export var nearestItem = null
@export var inRange = false
@export var speed = 400
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	velocity = Vector2(0, 0)
	
	if is_on_floor() == false:
		velocity.y += gravity * delta * 12
	
	var moveDirection = Input.get_axis("move_left", "move_right")
	velocity.x = moveDirection * speed
		
	var screen_size = get_viewport_rect().size
	global_position = global_position.clamp(Vector2(0, 0), screen_size)

	move_and_slide()
