extends CanvasLayer

@onready var anim_tween = get_tree().create_tween()

func _ready():
	anim_tween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	set_visible(false)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if Globals.level_started:
			if get_tree().is_paused():
				unpause()
			else:
				pause()

func pause():
	set_visible(true)
	get_tree().paused = true # I wanted to try animating but it didn't work
	anim_tween.tween_property($BlurBG, "shader_parameter/zoom", 2, 0.5)
	anim_tween.tween_property($BlurBG, "shader_parameter/blur_amount", 1.5, 0.5)
	anim_tween.tween_property($BlurBG, "shader_parameter/alpha_blend", 2, 0.5)
	anim_tween.tween_property($VBoxContainer, "modulate", Color.hex(0xffffffff), 0.5)

func unpause():
	anim_tween.tween_property($BlurBG, "shader_parameter/zoom", 1, 0.5)
	anim_tween.tween_property($BlurBG, "shader_parameter/blur_amount", 0, 0.5)
	anim_tween.tween_property($BlurBG, "shader_parameter/alpha_blend", 0, 0.5)
	anim_tween.tween_property($VBoxContainer, "modulate", Color.hex(0xffffff00), 0.5)
	await get_tree().create_timer(0.5).timeout
	get_tree().paused = false
	set_visible(false)


func _on_continue_button_pressed():
	if get_tree().is_paused():
		unpause()


func _on_restart_button_pressed():
	get_tree().paused = false
	Globals.level_started = false
	get_parent().reload_game()


func _on_quit_button_pressed():
	get_tree().quit()
