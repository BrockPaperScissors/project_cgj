extends State

@onready var idle: Node = $"../idle"
@export var idle_state: State
@export var interact_state: State
@export var move_state: State
@export var prevDirection = 1

func enter() -> void:
	super()
	parent.velocity.x = 0
	
func process_physics(delta: float) -> State:
	var moveDirection = Input.get_axis("move_left", "move_right")
	
	if moveDirection == 0.0:
		if prevDirection == -1:
			idle.animation_name = "idle_left"
		if prevDirection == 1:
			idle.animation_name = "idle_right"
		return idle_state
		
	elif moveDirection != 0.0:
		if moveDirection == 1:
			animation_name = "move_right"
		if moveDirection == -1:
			animation_name = "move_left"
			
		prevDirection = moveDirection
		parent.velocity.x = moveDirection * parent.speed
		
		parent.move_and_slide() 
		
		return move_state
	
	return null
