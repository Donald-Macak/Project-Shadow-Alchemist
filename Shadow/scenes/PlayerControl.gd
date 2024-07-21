extends CharacterBody2D

const SPEED : float = 300.0
const FRICTION : float = 30.0

func _ready():
	pass

func _physics_process(delta):
	input_to_velocity()
	move_and_slide()

func get_directional_input() -> Vector2:
	var h_axis = Input.get_axis("ui_left","ui_right")
	var v_axis = Input.get_axis("ui_up","ui_down")
	return Vector2(h_axis, v_axis).limit_length(1.0)

func input_to_velocity() -> void:
	var input = get_directional_input()
	var target = input * SPEED
	
	if input:
		velocity = velocity.move_toward(target, SPEED)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
