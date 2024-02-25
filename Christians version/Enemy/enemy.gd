extends CharacterBody2D

@export var movement_speed = 50.0
@onready var sprite = $weakenemy
@onready var anim = $AnimationPlayer
@onready var player = get_tree().get_first_node_in_group("player")
#added
@export var Health = 10

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
		queue_free()

