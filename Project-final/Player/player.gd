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
@onready var levelPanel = get_node("%LevelUp")
@onready var upgradeOptions = get_node("%UpgradeOptions")
@onready var itemOptions = preload("res://Utility/upgrade_option.tscn")
@onready var snd_levelUp = get_node("%snd_levelup")

#UPGRADES - added
var collected_upgrades = []
var upgrade_options = []
var damage_level = 0
var fire_rate_level = 0
var speed_level = 0




@onready var Game_Over = get_node("%Game_Over")
#ready function - christian added
func _ready():
	set_exp_bar(experience, calculate_experience_cap())

#Peter Adding --------------
var Health : float = 100.0
var MaxHealth :float  = 100.0
var fire_rate : float = 0.5
var can_fire : bool = true

@onready var Health_bar = $GUILayer/HealthBar

#adding
var experience = 0
var experience_level = 1
var collected_experience = 0

#vfinal
var DeathSoundBool : bool = false

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
	update_health_bar()
	print("player taking a hit")
	print(Health)
	if Health <= 0 and not DeathSoundBool:
		sprite.visible = false
		movement_speed = 0
		var tween = Game_Over.create_tween()
		tween.tween_property(Game_Over, "position", Vector2(220,50), 0.2).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_IN)
		tween.play()
		$World_music.stop()
		$GUILayer/Game_Over/DeathSound.play()
		DeathSoundBool = true
		Game_Over.visible = true
		
		
		

func _on_firing_cooldown_timeout():
	can_fire = true
#------------------------------------------
func update_health_bar():
	var health_percentage : float = Health / MaxHealth
	print("percentage:")
	print(health_percentage)
	Health_bar.value = health_percentage * 100

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
		experience = 0
		exp_required = calculate_experience_cap()
		levelup()
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
func _on_button_pressed():
	get_tree().change_scene_to_file("res://TitleScreen/menu.tscn")




#level function - christian add
func levelup():
	snd_levelUp.play()
	lblLevel.text = str("Level: ", experience_level)
	var tween = levelPanel.create_tween()
	tween.tween_property(levelPanel, "position", Vector2(220,50), 0.2).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_IN)
	tween.play()
	levelPanel.visible = true
	var options = 0
	var optionsmax = 3
	while options < optionsmax:
		var option_choice = itemOptions.instantiate()
		option_choice.upgrade = get_random_upgrade()
		upgradeOptions.add_child(option_choice)
		options += 1
	get_tree().paused = true

#upgrade - added
func upgrade_character(upgrade):
	match upgrade:
		"damageup1":
			damage_level = 1
		"damageup2":
			damage_level = 2
		"damageup3":
			damage_level = 3
		"damageup4":
			damage_level = 4
		"damageup5":
			damage_level = 5
		"damageup6":
			damage_level = 6
		"damageup7":
			damage_level = 7
		"damageup8":
			damage_level = 8
		"damageup9":
			damage_level = 9
		"damageup10":
			damage_level = 10
		"fireup1":
			fire_rate_level = 1
			fire_rate -= 0.05
		"fireup2":
			fire_rate_level = 2
			fire_rate -= 0.05
		"fireup3":
			fire_rate_level = 3
			fire_rate -= 0.05
		"fireup4":
			fire_rate_level = 4
			fire_rate -= 0.05
		"fireup5":
			fire_rate_level = 5
			fire_rate -= 0.05
		"fireup6":
			fire_rate_level = 6
			fire_rate -= 0.05
		"fireup7":
			fire_rate_level = 7
			fire_rate -= 0.05
		"fireup8":
			fire_rate_level = 8
			fire_rate -= 0.05
		"fireup9":
			fire_rate_level = 9
			fire_rate -= 0.05
		"fireup10":
			fire_rate_level = 10
			fire_rate -= 0.05
		"speedup1":
			speed_level = 1
			movement_speed += 10
		"speedup2":
			speed_level = 2
			movement_speed +=10
		"speedup3":
			speed_level = 3
			movement_speed +=10
		"speedup4":
			speed_level = 4
			movement_speed +=10
		"speedup5":
			speed_level = 5
			movement_speed +=10
		"speedup6":
			speed_level = 6
			movement_speed +=10
		"speedup7":
			speed_level = 7
			movement_speed +=10
		"speedup8":
			speed_level = 8
			movement_speed +=10
		"speedup9":
			speed_level = 9
			movement_speed +=10
		"speedup10":
			speed_level = 10
			movement_speed +=10
		"heart":
			Health += 20
			Health = clamp(Health,0,MaxHealth)
	var option_children = upgradeOptions.get_children()
	for i in option_children:
		i.queue_free()
	upgrade_options.clear()
	collected_upgrades.append(upgrade)
	levelPanel.visible = false
	levelPanel.position = Vector2(800,50)
	get_tree().paused = true
	calculate_experience(0)

func get_random_upgrade():
	var dblist = []
	for i in UpgradeDb.UPGRADES:
		if i in collected_upgrades:
			pass
		elif i in upgrade_options:
			pass
		elif UpgradeDb.UPGRADES[i]["type"] == "item":
			pass
		elif UpgradeDb.UPGRADES[i]["prerequisite"].size() > 0:
			var to_add = true
			for n in UpgradeDb.UPGRADES[i]["prerequisite"]:
				if not n in collected_upgrades:
					to_add = false
			if to_add:
				dblist.append(i)
		else:
			dblist.append(i)
	if dblist.size() > 0:
		var randomUpgrade = dblist.pick_random()
		upgrade_options.append(randomUpgrade)
		return randomUpgrade
	else:
		return null
