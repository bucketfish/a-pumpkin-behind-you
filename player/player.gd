extends KinematicBody2D


#establish scene name for saving
export var scene_id = "player"

#constants and stuff / physics
export (int) var speed = 300

export (float, 0, 1.0) var friction = 0.5
export (float, 0, 1.0) var acceleration = 0.5

#setting up ground variables
var velocity = Vector2.ZERO

var dialogue = false

var state = "idle"


onready var base = get_node("/root/base")
onready var anim = $anim
onready var sprite = $Sprite

func _ready():
	#turn on things, set the base
	pass
	

func get_input(delta):
	#if we don't want to take input, don't take input
	if base.state != "play":
		velocity.x = 0
		velocity.y = 0
		return
	
	
	#direction of player
	var dir = 0
	if Input.is_action_pressed("right"):
		dir += 1
	if Input.is_action_pressed("left"):
		dir -= 1
		
	if dir == 0:
		state = "idle"
	else:
		state = "walk"
		
	if dir == -1:
		sprite.flip_h = false
	elif dir == 1:
		sprite.flip_h = true
	
	#sideways speed, and/or friction
	if dir != 0:
		velocity.x = lerp(velocity.x, dir * speed, acceleration * delta * 70)
	else:
		velocity.x = lerp(velocity.x, 0, friction * delta * 70)
		
	anim.play(state)

	#apply gravity when fin
		
func _physics_process(delta):
	get_input(delta)
	var snap = Vector2.DOWN
	velocity = move_and_slide_with_snap(velocity, snap, Vector2.UP )
	

