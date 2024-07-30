extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_brew_button_pressed():
	print("lets get cooking")
	if($FireLabel.text == "" && $EarthLabel.text == "" && $AirLabel.text == "" && $WaterLabel.text == ""):
		print("you made nothing.....")
	$AirLabel.text = ""
	$AirSlot/AirRect.texture = null
	$EarthLabel.text = ""
	$EarthSlot/EarthRect.texture = null
	$FireLabel.text = ""
	$FireSlot/FireRect.texture = null
	$WaterLabel.text = ""
	$WaterSlot/WaterRect.texture = null


func _on_empty_button_pressed():
	print("lets start again")
	$AirLabel.text = ""
	$AirSlot/AirRect.texture = null
	$EarthLabel.text = ""
	$EarthSlot/EarthRect.texture = null
	$FireLabel.text = ""
	$FireSlot/FireRect.texture = null
	$WaterLabel.text = ""
	$WaterSlot/WaterRect.texture = null

func _on_air_button_pressed():
	print("clicked air")
	if UiControls.selected_Item:
		$AirLabel.text = UiControls.selected_Item_Name
		$AirSlot/AirRect.texture = UiControls.selected_Item_Texture

func _on_water_button_pressed():
	print("clicked water")
	if UiControls.selected_Item:
		$WaterLabel.text = UiControls.selected_Item_Name
		$WaterSlot/WaterRect.texture = UiControls.selected_Item_Texture


func _on_earth_button_pressed():
	print("clicked earth")
	if UiControls.selected_Item:
		$EarthLabel.text = UiControls.selected_Item_Name
		$EarthSlot/EarthRect.texture = UiControls.selected_Item_Texture


func _on_fire_button_pressed():
	print("clicked fire")
	if UiControls.selected_Item:
		$FireLabel.text = UiControls.selected_Item_Name
		$FireSlot/FireRect.texture = UiControls.selected_Item_Texture
