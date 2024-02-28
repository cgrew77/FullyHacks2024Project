extends ColorRect

@onready var lblName = $lbl_name
@onready var lblDescription = $lbl_description
@onready var lblLevel = $lbl_level
@onready var upgradeIcon = $ColorRect/UpgradeIcon

var mouse_over = false
var upgrade = null
@onready var player = get_tree().get_first_node_in_group("player")

signal selected_upgrade(upgrade)

func _ready():
	connect("selected_upgrade",Callable(player,"upgrade_character"))
	if upgrade == null:
		upgrade = "heart"
	lblName.text = UpgradeDb.UPGRADES[upgrade]["displayname"]
	lblDescription.text = UpgradeDb.UPGRADES[upgrade]["details"]
	lblLevel.text = UpgradeDb.UPGRADES[upgrade]["level"]
	upgradeIcon.texture = load(UpgradeDb.UPGRADES[upgrade]["icon"])
	
func _input(event):
	if event.is_action("click"):
		if mouse_over:
			emit_signal("selected_upgrade",upgrade)
			get_tree().paused = false

func _on_mouse_entered():
	mouse_over = true

func _on_mouse_exited():
	mouse_over = false
