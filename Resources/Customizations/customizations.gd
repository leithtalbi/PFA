extends Resource
class_name Customizations

#region Textures
# Wheels
var wheel_normal_texture = ResourceLoader.load("res://Images/Car/Wheel.png")
var wheel_big_texture = ResourceLoader.load("res://Images/Car/WheelBig.png")
var wheel_medium_texture = ResourceLoader.load("res://Images/Car/WheelMedium.png")

# Car bodies
var car_blue_texture = ResourceLoader.load("res://Images/Car/Car.png")
var car_red_texture = ResourceLoader.load("res://Images/Car/RedCar.png")

# Characters
var character_blue_head_texture = ResourceLoader.load("res://Images/Characters/Head.png")
var character_red_head_texture = ResourceLoader.load("res://Images/Characters/Head2.png")
#endregion

#region Misc values
var wheel_holder_height : int = 0

var wheel_holder_softness : float = 2.52 # unused?
#endregion

#region Collision resources
var wheel_normal_collider = ResourceLoader.load("res://Resources/Wheels/wheel_normal.tres")
var wheel_big_collider = ResourceLoader.load("res://Resources/Wheels/wheel_big.tres")
var wheel_medium_collider = ResourceLoader.load("res://Resources/Wheels/wheel_medium.tres")
#endregion
