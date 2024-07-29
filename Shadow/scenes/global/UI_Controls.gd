extends Node2D

## Initialize New Inventory
var inventory = []

## This will create a pathway to the Inventory Scene so
## it knows whenever we want to update any aspect of if
signal inventory_updated

@onready var inventory_slot_scene = preload("res://scenes/UI/Inventory/inventory_slot.tscn")

## This will help us identify the player controlled node later on
## We will use this for collision detection within the Inventory_Item Script
## We are using a function to update this value from within the player script
var player_node: Node = null



# Called when the node enters the scene tree for the first time.
func _ready():
	##set the inventory to be an array with 27 index positions
	inventory.resize(27)


## Inventory Function Script Start
## This function will be able to be called whenever you want something added to inventory
func add_item(item):
	print("add_item entered")
	## loop through inventory to find a place to either stack or place the aquired item
	for i in range(inventory.size()):
		## This script checks
		## if a slot is empty - if not
		## then checks if the slot has the same item type - if it does
		## if it also has the same listed effect
		if inventory[i] != null and inventory[i]["item_type"] == item["item_type"] and inventory[i]["item_effect"] == item["item_effect"]:
			## instead of adding the item data again
			## we are just incrementing the quantity by the amount offered by the item arguement
			inventory[i]["quantity"] += item["quantity"]
			## this signals the inventory to update to the new condition of inventory dictionary
			inventory_updated.emit()
			## This confirms the action completes, and exits the function
			print("Item added", inventory)
			return true
		## If no duplicates are found we will enter this block instead
		## It will simply fill the first inventory value that is empty
	for i in range(inventory.size()):
		if inventory[i] == null:
			inventory[i] = item
			inventory_updated.emit()
			print("Item added", inventory)
			return true
		## This only triggers if neither return function above is hit for some reason
		## This can be examined for debugging at a later time
	return false

## This function will be able to be called whenever you want something removed from inventory
func remove_item(item):
	inventory_updated.emit()

## Inventory Function Script End

## Used to identify a reference to player node without the need for additional
## script in each file
func set_player_reference(player):
	player_node = player
