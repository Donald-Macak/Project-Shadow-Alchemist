extends Node2D
class_name HealthNode

@export var MAX_HEALTH := 100
var health : float

func _ready():
	health = MAX_HEALTH

func damage(amount: int):
	health -= amount

	if health <= 0:
		kill_owner()
		

func kill_owner():
	get_parent().queue_free()
