extends RigidBody2D
class_name Player

var wheels = []
var speed = 15000
var max_speed = 50
var fuel = 100
var dead = false
var driving = 0

@onready var car_sprite = $Car
@onready var car_body_collider = $CollisionPolygon2D
@onready var player_body_sprite = $Body
@onready var player_head_sprite = $Head/Sprite2D

@onready var customizations_resource = Customizations.new()

func _ready():
	wheels = get_tree().get_nodes_in_group("wheel")
	get_parent().update_fuel_UI(fuel)
	
func _physics_process(delta):
	if Globals.level_started:
		drive(delta)

func drive(delta):
	driving = 0
	
	if fuel > 0 && !dead:
		$GameOverTimer.stop()
		if Input.is_action_pressed("ui_right"):
			driving += 1
			apply_torque_impulse(-2000 * delta * 60)

			for wheel in wheels:
				if wheel.angular_velocity < max_speed:
					wheel.apply_torque_impulse(speed * delta * 60)
					
		if Input.is_action_pressed("ui_left"):
			driving += 1
			apply_torque_impulse(500 * delta * 60)

			for wheel in wheels:
				if wheel.angular_velocity > -max_speed:
					wheel.apply_torque_impulse(-speed * delta * 60)
	else:
		if $GameOverTimer.is_stopped():
			$GameOverTimer.start()

	if $Head.rotation_degrees > 90 || $Head.rotation_degrees < -90  && !dead:
		dead = true
		$Head/HeadSpring.node_b = ""
	
	if driving == 1:
		$EngineSFX.pitch_scale = lerp($EngineSFX.pitch_scale, 2.0, 2.0 * delta)
		use_fuel(delta)
	else:
		$EngineSFX.pitch_scale = lerp($EngineSFX.pitch_scale, 1.0, 2.0 * delta)

func refuel():
	fuel = 100
	get_parent().update_fuel_UI(fuel)
	
func use_fuel(delta):
	fuel -= 10 * delta
	fuel = clamp(fuel, 0, 100)
	get_parent().update_fuel_UI(fuel)


func _on_game_over_timer_timeout():
	#TODO: change into a game over screen and display results for the current course
	get_tree().reload_current_scene()

func customize_vehicle():
	# Wheels
	for wheel in wheels:
		match Globals.current_wheel:
			Globals.wheel_settings.NORMAL:
				wheel.sprite.texture = customizations_resource.wheel_normal_texture
				wheel.collider.set_shape(customizations_resource.wheel_normal_collider)
			Globals.wheel_settings.BIG:
				wheel.sprite.texture = customizations_resource.wheel_big_texture
				wheel.collider.set_shape(customizations_resource.wheel_big_collider)
			Globals.wheel_settings.MEDIUM:
				wheel.sprite.texture = customizations_resource.wheel_medium_texture
				wheel.collider.set_shape(customizations_resource.wheel_medium_collider)
	
	# Car body
	match Globals.current_car_body:
		Globals.car_body_settings.BLUE:
			car_sprite.texture = customizations_resource.car_blue_texture
		Globals.car_body_settings.RED:
			car_sprite.texture = customizations_resource.car_red_texture
	
	# Head
	match Globals.current_character:
		Globals.character_settings.BLUE:
			player_head_sprite.texture = customizations_resource.character_blue_head_texture
			player_body_sprite.texture = customizations_resource.character_blue_body_texture
		Globals.character_settings.RED:
			player_head_sprite.texture = customizations_resource.character_red_head_texture
			player_body_sprite.texture = customizations_resource.character_red_body_texture
