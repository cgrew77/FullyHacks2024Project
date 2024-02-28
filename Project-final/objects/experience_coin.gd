extends Area2D

@export var experience = 1

var spr_copper = preload("res://objects/copper.png")
var spr_silver = preload("res://objects/silver.png")
var spr_gold = preload("res://objects/gold.png")

var target = null
var speed = -1

@onready var sprite = $Sprite2D
@onready var collision = $CollisionShape2D
@onready var sound = $Coin_collected
@onready var anim = $AnimationPlayer

func _ready():
	anim.play("coin_spin")
	if experience < 5:
		return
	elif experience < 25:
		sprite.texture = spr_silver
	else:
		sprite.texture = spr_gold

func _physics_process(delta):
	if target != null:
		global_position = global_position.move_toward(target.global_position, speed)
		speed += 6*delta

func collect():
	sound.play()
	collision.call_deferred("set", "disabled")
	sprite.visible = false
	return experience



func _on_coin_collected_finished():
	queue_free()
