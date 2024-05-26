extends CanvasLayer

var player_object : Player

func _ready():
	player_object = get_tree().get_first_node_in_group("player")

func hide_gui():
	get_parent().anim.play_backwards("level_start")
	var anim_tween = get_tree().create_tween()
	#anim_tween.tween_property($BlurBG, "shader_parameter/zoom", 1, 0.5)
	#anim_tween.tween_property($BlurBG, "shader_parameter/alpha_blend", 0, 0.5)
	anim_tween.tween_property(self, "offset", Vector2(0, -1200), 1).set_trans(Tween.TRANS_BACK).set_delay(0.5)
	Globals.level_started = true

func _on_start_button_pressed():
	if !Globals.level_started:
		hide_gui()

#region Wheel buttons
func _on_wheel_button_1_pressed():
	Globals.current_wheel = Globals.wheel_settings.NORMAL
	player_object.customize_vehicle()

func _on_wheel_button_2_pressed():
	Globals.current_wheel = Globals.wheel_settings.MEDIUM
	player_object.customize_vehicle()

func _on_wheel_button_3_pressed():
	Globals.current_wheel = Globals.wheel_settings.BIG
	player_object.customize_vehicle()

#endregion

#region Car buttons
func _on_car_button_1_pressed():
	Globals.current_car_body = Globals.car_body_settings.BLUE
	player_object.customize_vehicle()

func _on_car_button_2_pressed():
	Globals.current_car_body = Globals.car_body_settings.RED
	player_object.customize_vehicle()

#endregion

#region Character head buttons
func _on_character_button_1_pressed():
	Globals.current_character = Globals.character_settings.BLUE
	player_object.customize_vehicle()


func _on_character_button_2_pressed():
	Globals.current_character = Globals.character_settings.RED
	player_object.customize_vehicle()

#endregion
