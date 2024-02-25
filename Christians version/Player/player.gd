extends CharacterBody2D
#Peter add
var bullet_scene = preload("res://Bullets/bullet.tscn")
#-----------
var movement_speed = 100.0
@onready var sprite = $Player
@onready var walkTimer = get_node("%walkTimer")

#Peter Adding --------------
var Health : float = 100.0
#v2
var MaxHealth :float  = 100.0
var fire_rate : float = 0.5
var can_fire : bool = true
#---------------------------

#v2
@onready var Health_bar = $GUILayer/HealthBar


func _physics_process(delta):
	movement()

func movement():
	var x_mov = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_mov = Input.get_action_strength("down") - Input.get_action_strength("up")
	var mov = Vector2(x_mov, y_mov)
	if mov.x < 0:
		sprite.flip_h = true
	elif mov.x > 0:
		sprite.flip_h = false
	if mov != Vector2.ZERO:
		if walkTimer.is_stopped():
			if sprite.frame >= sprite.hframes - 1:
				sprite.frame = 0
			else:
				sprite.frame += 1
			walkTimer.start()
	
	velocity = mov.normalized()*movement_speed
	move_and_slide()


#Peter added --------------------------
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
		$FiringCooldown.start(fire_rate)

#added
func _on_hurt_box_hurt(damage):
	Health -= damage
	#v2
	update_health_bar()
	print("player taking a hit")
	print(Health)

func _on_firing_cooldown_timeout():
	can_fire = true
	

#------------------------------------------

#v2
func update_health_bar():
	var health_percentage : float = Health / MaxHealth
	print("percentage:")
	print(health_percentage)
	Health_bar.value = health_percentage * 100
	
