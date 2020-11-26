extends Spatial

onready var monster = $GridMap/Monster
onready var player = $GridMap/player
onready var orb_container = $GridMap/OrbContainer
onready var fader = $Fader

var collected_orbs = 0
var total_orb_count = 0

func _ready():
	monster.set_target(player)

	total_orb_count = orb_container.get_child_count()
	
	player.connect("orb_collected", self, "on_orb_collected")
	fader.connect("fade_finished", self, "on_fade_finished")
	
func on_orb_collected():
	collected_orbs += 1
	if collected_orbs >= total_orb_count:
		fader.set_playback_speed(0.5)
		fader.fade_out()
		
func on_fade_finished():
	get_tree().change_scene("res://src/VictoryScene.tscn")
	
