extends State


@export var move_state: State
@export var interact_state: State
@onready var move: Node = $"../move"
@onready var interact: Node = $"../interact"


func enter() -> void:
	super()
	parent.velocity.x = 0
	
func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed('interact'):
		if move.prevDirection == 1:
			interact.animation_name = "interact_right"
		if move.prevDirection == -1:
			interact.animation_name = "interact_left"
		return interact_state
	if Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right"):
		return move_state

	return null

func process_physics(delta: float) -> State:
	if !parent.is_on_floor():
		parent.velocity.y += gravity * delta
	parent.move_and_slide()

	return null
