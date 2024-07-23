extends CharacterBody2D

const SPEED : float = 300.0
const FRICTION : float = 30.0

## Reference to the UI in the scene
@onready var inventory_ui = $InventoryUI


func _ready():
	## This Script is updating a global variable letting us know this is the active
	## player controlled node. It can be used to reference interactions between any other nodes
	## We can only identify this script, because I've configured every Script to have acess from
	UiControls.set_player_reference(self)

## Functions For Character Movement Start
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
## Functions For Character Movement End



## Functions For Menus Start

func _input(event):
	## Input events are detected from the Project Settings
	## "Toggle_Inventory" is set to Q in Input Map
	if event.is_action_pressed("Toggle_Inventory"):
		## The bang operator is assighning the value to equal the inverse
		## of its current value. (True --> False)
		inventory_ui.visible = !inventory_ui.visible
		## Pausing During Menus open
		## get_tree referes to the entire active scene
		## If you wish to include it in any other features its best practice
		## To make the controller still able to recieve inputs
		## In the inspector tab go to Node-Process-Mode
		## This should be switched to always
		print("Toggle Mode")
		get_tree().paused = !get_tree().paused
		
## Functions For Menus End
