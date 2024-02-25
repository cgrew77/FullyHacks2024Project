extends CharacterBody2D

@export var movement_speed = 50.0
#added
@export var Health = 10

@onready var player = get_tree().get_first_node_in_group("player")




func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * movement_speed
	move_and_slide()


#added
func _on_hurt_box_hurt(damage):
	print("ow im at ")
	Health -= damage
	print(Health)
	if Health <= 0:
		queue_free()

