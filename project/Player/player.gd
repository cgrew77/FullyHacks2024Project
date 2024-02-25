extends CharacterBody2D
#Peter add
var bullet_scene = preload("res://Bullets/bullet.tscn")
#-----------
var movement_speed = 100.0
@onready var sprite = $Player
@onready var walkTimer = get_node("%walkTimer")

#GUI - christian added
@onready var expBar = get_node("%ExperienceBar")
@onready var lblLevel = get_node("%lbl_level")

#ready function - christian added
func _ready():
	set_exp_bar(experience, calculate_experience_cap())

#Peter Adding --------------
var Health = 100
var fire_rate : float = 0.5
var can_fire : bool = true
#---------------------------
#adding
var experience = 0
var experience_level = 1
var collected_experience = 0

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
	print("player taking a hit")
	print(Health)

func _on_firing_cooldown_timeout():
	can_fire = true
#------------------------------------------

#experience grab - christian added
func _on_grab_area_area_entered(area):
	if area.is_in_group("loot"):
		area.target = self

#experience collect - christian added
func _on_collect_area_area_entered(area):
	if area.is_in_group("loot"):
		var coin_exp = area.collect()
		calculate_experience(coin_exp)

#calc collected experience - christian added
func calculate_experience(coin_exp):
	var exp_required = calculate_experience_cap()
	collected_experience += coin_exp
	if experience + collected_experience >= exp_required: #levelup
		collected_experience -= exp_required - experience
		experience_level += 1
		lblLevel.text = str("Level: ", experience_level)
		experience = 0
		exp_required = calculate_experience_cap()
		calculate_experience(0)
	else:
		experience += collected_experience
		collected_experience = 0
	set_exp_bar(experience, exp_required)

#calc needed exp - christian added
func calculate_experience_cap():
	var exp_cap = experience_level
	if experience_level < 20:
		exp_cap = experience_level * 5
	elif experience_level < 40:
		exp_cap = 95 * (experience_level - 19) * 8
	else:
		exp_cap = 255 * (experience_level - 39) * 12
	return exp_cap

#set exp bar - christian added
func set_exp_bar(set_value = 1, set_max_value = 100):
	expBar.value = set_value
	expBar.max_value = set_max_value
