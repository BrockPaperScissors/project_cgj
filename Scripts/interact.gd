extends State

@export var idle_state: State
@export var move_state: State


func enter() -> void:
	super()
	parent.velocity.x = 0
	
func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right"):
		return move_state
		
	return null


	
