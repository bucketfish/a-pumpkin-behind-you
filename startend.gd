extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var maintext = $Node2D/text
onready var othertext = $Node2D/text2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func set_start():
	maintext.text = "a pumpkin behind you"
	othertext.text = "press up arrow or enter to begin."
	
func set_end():
	maintext.text = "the end!"
	othertext.text = "thank you for playing 'a pumpkin behind you'!! \nthis game was made by bucketfish :)"
