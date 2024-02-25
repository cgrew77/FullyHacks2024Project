extends CharacterBody2D

var bullet_scene = preload("res://Bullets/bullet.tscn")

var movement_speed = 100.0
#added
var Health = 100
var fire_rate : float = 0.5
var can_fire : bool = true





func _physics_process(delta):
	movement()

func movement():
	var x_mov = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_mov = Input.get_action_strength("down") - Input.get_action_strength("up")
	var mov = Vector2(x_mov, y_mov)
	velocity = mov.normalized()*movement_speed
	move_and_slide()
	
	#added
	#for i in get_slide_collision_count():
		#var collision = get_slide_collision(i)
		#print("I collided with ", collision.get_collider().name)




#added
func _process(delta):
	var mouse_position = get_global_mouse_position()
	var mouse_direction = (mouse_position - global_position).normalized()
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		shoot(mouse_direction)
#added
func shoot(direction):
	if can_fire:
		
		var bullet_instance = bullet_scene.instantiate()
		add_child(bullet_instance)
		bullet_instance.velocity = direction * bullet_instance.speed
		can_fire = false
		$Timer.start(fire_rate)



#added
func _on_hurt_box_hurt(damage):
	Health -= damage
	print("player taking a hit")
	print(Health)



func _on_timer_timeout():
	can_fire = true
