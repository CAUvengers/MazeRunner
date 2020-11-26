extends Spatial

onready var main_menu_button = $ColorRect/Control/VBoxContainer/CenterContainer/VBoxContainer/MainMenuButton
onready var quit_button = $ColorRect/Control/VBoxContainer/CenterContainer/VBoxContainer/QuitButton

export (PackedScene) var main_menu = null

func _ready():
	main_menu_button.connect("pressed", self, "on_main_menu_pressed")
	quit_button.connect("pressed", self, "on_quit_pressed")
	
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
func on_main_menu_pressed():
	get_tree().change_scene_to(main_menu)
	
func on_quit_pressed():
	get_tree().quit()

