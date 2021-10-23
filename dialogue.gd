extends Node2D


var lines = {
	"all":[
		["s", "door_knock", "to_end"],
		["s", "door_open", "to_end"],
		["t", "trick or treat!", "c"],
	],
	1:[
		["t", "who- who are you?", "j"],
		["t", "i'm ghostcat! trick or treat?", "c"],
		["t", "give us candy or you'll regret it!", "p"],
		["t", "ah... young people. so much energy.", "j"],
		["t", "but where's the respect?", "j"],
		["t", "i'm so sorry... pompkin didn't mean it.", "c"],
		["t", "that's what you think!!!", "p"],
		["t", "pompkin no!!!", "c"],
		["t", "i just want to trick or treat :(", "c"],
		["t", "all the kids finished my candy already. you're too late.", "j"],
		["t", "aw...", "c"],
		["t", "it's okay!!! we never wanted your candy anyways!!!", "p"],
		["t", "pompkin no!!!!!", "c"],
		["t", "oh well. maybe check the next house over?", "j"],
		["t", "they usually have a bunch.", "j"],
		["t", "thank you! i'll check it out!", "c"],
		["t", "bye old person!!", "p"],
		["t", "pompkin we're not gonna get any candy this way :(", "c"],
		["t", "it's alright~ haters gonna hate~!", "p"]
	],
	2:[
		
	],
	3:[
		["t", "hi!! i'm ghostcat!", "c"],
		["t", "can't believe you're actually talking to a plant...", "p"],
		["t", "wow, how rude.", "l"],
		["t", "pompkin! shut up! you're a plant too!", "c"],
		["t", "honestly, leave me out of your lil fight. i'll just-", "l"],
		["t", "no!!!! wait wait wait", "c"],
		["t", "pompkin go apologise to them right now!", "c"],
		["t", "hmm...", "p"],
		["t", "you're not as orange as me ! too bad for you.", "p"],
		["t", "pompkin no!!!!!", "c"],
		["t", "sigh, perhaps one day you can teach your lil fruit some respect.", "l"],
		["t", "i just want some candy :/", "c"],
		["t", "aw... as much as i pity you, i don't have any.", "l"],
		["t", "i'm also just a plant, after all.", "l"],
		["t", "ah... right.", "c"],
		["t", "told ya!!!", "p"],
		["t", "shut up!!!", "c"],
		["t", "oh well, thank you for your time!", "c"],
		["t", "no problem, buddy. good luck out there.", "l"],
		["t", "... we have no candy today.", "c"],
		["t", "it's fine!!! we don't need candy!!", "p"],
		["t", "i wanted candy this year tho :/", "c"],
		["t", "... what if we check that last shrub at the end?", "p"],
		["t", "maybe someone dropped candy there by accident.", "p"],
		["t", "ah... maybe. okay...", "c"]
	],
	"end":[
		[]
	]
}

signal click_next

onready var text = $text
onready var base = get_node("/root/base")

var colors = {
	"c": "#000000",
	"p": "#ECAA53",
	"j": "#74586C",
	"j2": "#ECAA53",
	"l": "#61995D",
}

var names = {
	"c": "ghostcat",
	"p": "pompkin",
	"j": "old person",
	"j2": "witchy kid",
	"l": "plant",
}


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false

func play(num):
	visible = true
	for i in lines[num]:
		if i[0] == "s":
			pass
		
		elif i[0] == "t":
			text.visible = false
			text.text = names[i[2]] + ": " + i[1]
			text.modulate = colors[i[2]]
			
			var seconds = 0.02 * text.get_total_character_count()
			$Tween.interpolate_property(text, "percent_visible", 0, 1, seconds, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
			$Tween.start()
			text.visible = true

			yield($Tween, "tween_completed")
			yield(self, "click_next")
			
	visible = false
	base.stop_cutscene()
	


func _input(event):
	if event.is_action_pressed("interact"):
		emit_signal("click_next")
