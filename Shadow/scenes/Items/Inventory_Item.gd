@tool
extends Node2D

## Basic Item Properties
## These can be anything, and we are exporting them so they can be easily accessible from 
## outside each individual items scope. We will often want to access them from the global
## inventory array
@export var item_type = ""
@export var item_name = ""
@export var item_texture: Texture
@export var item_effect = ""
var scene_path: String = "res://scenes/Items/Inventory_Item.tscn"

## Once ready has finished set icon_sprite equal to the child $Sprite2D
@onready var icon_sprite = $Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	## This Script causes the item's texture to load while viewing the scene during gameplay
	if not Engine.is_editor_hint():
		icon_sprite.texture = item_texture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	## This Script causes the item's texture to load while viewing the scene in Godot
	if Engine.is_editor_hint():
		icon_sprite.texture = item_texture

# Function for individual item to be picked up. This will help remove the item 
# from the current scene, and insert it to the global inventory array
func pickup_item():
	var item = {
		# quantity is only needed within scope of the pickup function
		# the one implies this function only picks up one item at a time.
		# I may consider adding a parameter for an amount 
		"quantity" : 1,
		"item_name" : item_name,
		"item_type" : item_type,
		"item_texture" : item_texture,
		"item_effect" : item_effect,
		"scene_path" : scene_path,
	}
	print(UiControls.player_node)
	print(item)
	if UiControls.player_node:
		UiControls.add_item(item)
		self.queue_free()

func _on_area_2d_body_entered(body):
	print("Collision Detected Within Item")
	## is_in_group is a built in function we can use to check a property on any
	## node within Godot. Where it says Inspector/Node/History
	## Go to Node- Then Group
	## I added on to the Player so we don't detect collision with anything but the player
	if body.is_in_group("Player"):
		pickup_item()
		return
