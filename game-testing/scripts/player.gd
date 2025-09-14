extends CharacterBody2D

@export var speed = 300
@export var gravity = 30
@export var jump_force = 500

func _physics_process(delta):
	if !is_on_floor():
		velocity.y += gravity
		if velocity.y > 1000:
			velocity.y = 1000
			
	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y = -jump_force
	
	
	var horizontal_direction = Input.get_axis("move_left", "move_right")
	
	velocity.x = speed * horizontal_direction
	
	var vertical_direction
	move_and_slide()


	print(velocity)


func _on_area_2d_body_entered(body: Node2D) -> void:
		win_game()


	

func win_game():
	print("You Win!")
	get_tree().change_scene_to_file("res://win_menu.tscn")



func _on_teleport_zone_body_entered(body: Node2D) -> void:
	if body == self:  
		var start_point = get_tree().current_scene.get_node("StartPoint")
		if start_point:
			global_position = start_point.global_position
			velocity = Vector2.ZERO 
		get_tree().change_scene_to_file("res://lose_menu.tscn")


func _on_jump_pad_body_entered(body: Node2D) -> void:
	if body == self:  
		velocity.y = -jump_force * 2
