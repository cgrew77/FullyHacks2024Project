extends CharacterBody2D

@export var movement_speed = 50.0
@onready var sprite = $weakenemy
@onready var anim = $AnimationPlayer
@onready var player = get_tree().get_first_node_in_group("player")
@export var Health = 10

#added christian
@onready var loot_base = get_tree().get_first_node_in_group("loot")
@export var experience = 1
var exp_coin = preload("res://objects/experience_coin.tscn")


func _ready():
	anim.play("walk")

func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * movement_speed
	move_and_slide()
	if direction.x > 0.1:
		sprite.flip_h = false
	elif direction.x < -0.1:
		sprite.flip_h = true



func _on_hurt_box_hurt(damage):
	print("ow im at ")
	Health -= damage
	print(Health)
	if Health <= 0:
		var new_coin = exp_coin.instantiate()
		new_coin.global_position = global_position
		new_coin.experience = experience
		loot_base.call_deferred("add_child", new_coin)
		queue_free()
