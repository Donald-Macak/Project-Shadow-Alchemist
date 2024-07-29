extends Control

##Getting Tired I will Comment this docuement later or DM me if needed
## about how it works. Mostly a great exercise in Executive Context

# Scene-Tree Node references

## Needs To Dynamically updated
@onready var item_sprite = $TextureRect/ItemSprite
@onready var item_quantity = $TextureRect/ItemQuantity

@onready var item_name = $DetailPanel/ColorRect/ItemName
@onready var item_type = $DetailPanel/ColorRect/ItemType
@onready var item_effect = $DetailPanel/ColorRect/ItemEffect

## Needs to be Hidden
@onready var detail_panel = $DetailPanel
@onready var use_panel = $UsePanel

## Might not need this
@onready var item_button = $ItemButton

#Slot Item variable
var item = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_item_button_pressed():
	# Prevents blank panels from being pushed
	print("button pressed")
	if item != null:
		use_panel.visible = !use_panel.visible


func _on_item_button_mouse_entered():
	print("mouse entered")
	print(item)
	if item != null:
		use_panel.visible = false
		detail_panel.visible = true


func _on_item_button_mouse_exited():
	detail_panel.visible = false

func set_empty():
	item_sprite.texture = null
	item_quantity.text = ""
	
func set_item(new_item):
	item = new_item
	##item_texture 
	item_sprite.texture = new_item["item_texture"]
	item_quantity.text = str(item["quantity"])
	item_name.text = str(item["item_name"])
	item_type.text = str(item["item_type"])
	if item["item_effect"] != "":
		item_effect.text = str("+ ", item["item_effect"])
	else:
		item_effect.text = ""
