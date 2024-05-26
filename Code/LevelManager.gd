extends Node2D

var coins_collected = 0

@onready var anim = $Animations

func add_coins(amount):
	coins_collected += amount
	$UI/Coin/Label.text = str(coins_collected)
	
func update_fuel_UI(value):
	$UI/Fuel/ProgressBar.value = value
	var stylebox = $UI/Fuel/ProgressBar.get("custom_styles/fg")
	if value == 0:
		$UI/Fuel/AnimationPlayer.play("alarm")
	else:
		$UI/Fuel/AnimationPlayer.play("idle")
	if stylebox != null:
			stylebox.bg_color.h = lerp(0, 0.3, value / 100)

func reload_game():
	get_tree().reload_current_scene()


func _on_world_boundary_body_entered(body):
	# Trigger gaem over screen :P
	if body is Player:
		get_tree().change_scene_to_file("res://Scenes/game_over_screen.tscn")
