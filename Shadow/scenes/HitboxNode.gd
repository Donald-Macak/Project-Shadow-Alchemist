extends Area2D
class_name HitboxNode

@export var damage_amount := 10

func _init() -> void:
	collision_layer = 8
	collision_mask = 0

