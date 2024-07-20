extends Area2D
class_name HurtboxNode
@export var health_node : HealthNode

func _init() -> void:
	collision_layer = 0
	collision_mask = 8

func _ready() -> void:
	connect("area_entered", self.damage)

func damage(hitbox: HitboxNode):
	if hitbox == null:
		return

	if health_node:
		health_node.damage(hitbox.damage_amount)
