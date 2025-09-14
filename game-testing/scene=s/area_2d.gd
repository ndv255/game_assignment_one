extends Area2D

@export var bounce_force: float = -800.0 

func _on_body_entered(body: Node) -> void:
	if body is CharacterBody2D:
		body.velocity.y = -body.jump_force * 2
		
