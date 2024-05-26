extends Node

# This singleton will contain the values shared across all game scenes, like coins and parameters
var total_coins_collected : int = 0
var level_started : bool = false

# Customization values
enum wheel_settings {NORMAL, BIG, MEDIUM}
var current_wheel = wheel_settings.NORMAL

enum car_body_settings {BLUE, RED}
var current_car_body = car_body_settings.BLUE

enum character_settings {BLUE, RED}
var current_character = character_settings.BLUE
