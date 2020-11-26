extends Spatial

onready var infector = $GridMap/Monster
onready var player = $GridMap/player
onready var orb_container = $GridMap/OrbContainer
onready var fader = $Fader

var orb_count = 0
var total_orb_count = 0

func _ready():
	infector.set_target(player)

	total_orb_count = orb_container.get_child_count()
	
	player.connect("orb_collected", self, "on_orb_collected")
	fader.connect("fade_finished", self, "on_fade_finished")
	
func on_orb_collected():
	orb_count += 1
	if orb_count >= total_orb_count:
		fader.set_playback_speed(0.5)
		fader.fade_out()
		
func on_fade_finished():
	get_tree().change_scene("res://src/VictoryScene.tscn")
	
