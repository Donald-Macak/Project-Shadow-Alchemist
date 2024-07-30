extends Control

@onready var grid_container = $GridContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	## This first line performs .connect(_on_inventory_updated)
	## On UiControls's inventory_updated signal variable
	## I believe this should make this script trigger every time we
	## call .emit() in the other file
	UiControls.inventory_updated.connect(_on_inventory_updated)
	_on_inventory_updated()

## Recieves Signal from the global world script
func _on_inventory_updated():
	print("running on_inventory_updated")
	clear_grid_container()
	for item in UiControls.inventory:
		var slot = UiControls.inventory_slot_scene.instantiate()
		grid_container.add_child(slot)
		if item != null:
			slot.set_item(item)
		else:
			slot.set_empty()

## The contents of inventory are stored in the dictionary variable
## This function will reset The Inventory_UI node to be empty
func clear_grid_container():
	print("running clear grid")
	## Children of the grid Containers will only exist if there is currently
	## Inventory loaded into the GridContainer
	## This loop will stop when the last child is deleted.
	while grid_container.get_child_count() > 0:
		##get current child at index 0
		var child = grid_container.get_child(0)
		## pass child in as arguement to remove_child
		grid_container.remove_child(child)
		## make child elegible for garbadge collection
		child.queue_free()

func _physics_process(delta):
	if ($"..".visible && UiControls.Cauldron_Nearby):
		#print("show user the Cauldron_UI AS WELL!")
		$Cauldron_UI.visible = true
	if ($"..".visible && !UiControls.Cauldron_Nearby):
		#print("DONT show user the Cauldron_UI AS WELL!")
		$Cauldron_UI.visible = false
