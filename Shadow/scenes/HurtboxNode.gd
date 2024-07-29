extends Area2D
class_name HurtboxNode
@export var health_node : HealthNode

func _init() -> void:
	collision_layer = 1
	collision_mask = 8

func _ready() -> void:
	print("ENEMY: I'm Ready")
	connect("area_entered", self.damage)

func damage(hitbox):
	print("Enemy: I'm Hit!!!")
	if hitbox == null or hitbox.owner == self.owner:
		return

	if health_node:
		health_node.damage(hitbox.damage_amount)
