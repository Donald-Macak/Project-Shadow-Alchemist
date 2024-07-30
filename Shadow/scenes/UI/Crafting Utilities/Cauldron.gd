extends Node2D

##My whole job is to detect collision, and pass a boolean up to UiControls

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	print("Collision Detected Within Cauldron")
	## is_in_group is a built in function we can use to check a property on any
	## node within Godot. Where it says Inspector/Node/History
	## Go to Node- Then Group
	## I added on to the Player so we don't detect collision with anything but the player
	if body.is_in_group("Player"):
		UiControls.Cauldron_Nearby = true
		print("Cauldron_Nearby set to true")


func _on_area_2d_body_exited(body):
	print("Exiting Collision  With Cauldron")
	## is_in_group is a built in function we can use to check a property on any
	## node within Godot. Where it says Inspector/Node/History
	## Go to Node- Then Group
	## I added on to the Player so we don't detect collision with anything but the player
	if body.is_in_group("Player"):
		UiControls.Cauldron_Nearby = false
		print("Cauldron_Nearby set to false")
