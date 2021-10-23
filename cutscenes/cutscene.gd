extends Area2D

onready var anim = $AnimationPlayer
onready var base = get_node("/root/base")

export var num = 0

var inside = false



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_cutscene_body_entered(body):
	anim.play("show")
	inside = true


func _on_cutscene_body_exited(body):
	anim.play("hide")
	inside = false
	
func _input(event):
	if event.is_action_pressed("interact") && inside == true:
		inside = false
		base.show_cutscene(num)
		anim.play("hide")
		yield(anim, "animation_finished")
		queue_free()
