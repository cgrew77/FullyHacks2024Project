extends Area2D


@export var speed : int = 500

#added
@export var bullet_damage: int = 5

var velocity : Vector2 = Vector2()

func _process(delta):
	translate(velocity * delta)
	

#added
func get_damage() -> int:
	return bullet_damage


func _on_bullet_hit_box_area_entered(area):
	queue_free()
