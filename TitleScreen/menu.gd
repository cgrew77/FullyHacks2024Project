extends Control

signal start_game

func _ready():
	$Help_back.hide()
	$Rules.hide()



func _on_btn_play_pressed():
	get_tree().change_scene_to_file("res://World/world.tscn")


func _on_btn_help_pressed():
	$Help_back.show()
	$Rules.show()
	$Title.hide()
	$btn_help.hide()
	$btn_play.hide()
	$btn_quit.hide()


func _on_btn_quit_pressed():
	get_tree().quit()


func hide_start_menu():
	$Background.hide()
	$Title.hide()
	$btn_help.hide()
	$btn_play.hide()
	$btn_quit.hide()
	


func _on_help_back_pressed():
	$Help_back.hide()
	$Rules.hide()
	$Title.show()
	$btn_help.show()
	$btn_play.show()
	$btn_quit.show()
