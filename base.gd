extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var sprite = $Sprite
onready var anim = $cutscenes
onready var playercam = $playercam
onready var cutscenecam = $cutscenecam
onready var dialogue = $CanvasLayer2/dialogue

var countdown = 3

var cutscenes = [
	"",
	preload("res://cutscenes/one.png"),
	preload("res://cutscenes/two.png"),
	preload("res://cutscenes/three.png"),
	preload("res://cutscenes/four.png")
]

var state = "idle"

# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer/ColorRect.modulate = "#ffffffff"
	
	state = "idle"
	cutscenecam.current = true
	yield(get_tree().create_timer(1), "timeout")
	
	start_game()

func start_game():
	dialogue.play("start")
	
	
	playercam.current = true
	state = "play"

func show_cutscene(num):
	countdown -= 1
	state = "pause"
	anim.play("fade")
	yield(anim, "animation_finished")
	cutscenecam.current = true
	sprite.texture = cutscenes[num]
	if num in [1, 2, 3]:
		dialogue.play(num)
	else:
		dialogue.play(num)
		anim.play_backwards("fade")
		yield(anim, "animation_finished")
	
func stop_cutscene():
	if $CanvasLayer/ColorRect.modulate == Color("#ffffff00"):
		anim.play("fade")
		yield(anim, "animation_finished")
	playercam.current = true
	sprite.texture = null
	anim.play_backwards("fade")
	yield(anim, "animation_finished")
	state = "play"
	
func end_game():
	anim.play("fade")
	yield(anim, "animation_finished")

	#sprite.texture = null

	


func _on_ending_body_entered(body):
	if countdown<=0:
		show_cutscene(4)
