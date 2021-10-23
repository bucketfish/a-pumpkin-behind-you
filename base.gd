extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var sprite = $Sprite
onready var anim = $cutscenes
onready var playercam = $playercam
onready var cutscenecam = $cutscenecam
onready var dialogue = $dialogue

var cutscenes = [
	"",
	preload("res://cutscenes/one.png"),
	preload("res://cutscenes/two.png"),
	preload("res://cutscenes/three.png"),
	#preload("res://cutscenes/four.png")
]

var state = "play"

# Called when the node enters the scene tree for the first time.
func _ready():
	playercam.current = true
	state = "play"

func show_cutscene(num):
	state = "pause"
	anim.play("fade")
	yield(anim, "animation_finished")
	cutscenecam.current = true
	sprite.texture = cutscenes[num]
	anim.play_backwards("fade")
	yield(anim, "animation_finished")
	dialogue.play(num)
	
func stop_cutscene():
	anim.play("fade")
	yield(anim, "animation_finished")
	playercam.current = true
	sprite.texture = null
	anim.play_backwards("fade")
	yield(anim, "animation_finished")
	state = "play"
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
