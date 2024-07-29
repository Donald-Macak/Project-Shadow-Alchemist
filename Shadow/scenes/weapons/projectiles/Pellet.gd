extends Node2D

@export var damage_amount := 10

var speed = 5
@onready var direction_vector =  get_global_mouse_position()  - get_parent().position
@onready var velocity = direction_vector * speed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += velocity * delta


func _on_pellet_timeout_timeout():
	queue_free()
 


func _on_hitbox_node_area_entered(hurtbox):
	print("I found a")
	print(hurtbox)
	## This script will crash if .health_node doesn't exist
	if hurtbox.health_node != null:
		hurtbox.damage(self)
	queue_free()
	pass
