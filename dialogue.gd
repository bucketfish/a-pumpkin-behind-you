extends Node2D


var lines = {
	"start":[
		#["t", "press up arrow or enter to continue)", "n"],
		["t", "happy halloween!!! it's trick or treat day!!", "c"],
		["t", "my only goal for today is to get some candy.", "c"],
		["t", "you can do it!!!!", "p"]
	],
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
		["t", "who's there~", "j2"],
		["t", "me! ghostcat!", "c"],
		["t", "and pompkin!", "p"],
		["t", "oh, hello~ let me grab my candy :)", "j2"],
		["t", "omg!! yay!", "c"],
		["t", "we're gonna take all of the candy!! ghostcat deserves all the candy!", "p"],
		["t", "pompkin no! we have to leave some for others too.", "c"],
		["t", "yea, don't take everything~", "j2"],
		["t", "no, ghostcat deserves all!! take all of it!!!", "p"],
		["t", "hey~! i'm not giving you candy if you take it all.", "j2"],
		["t", "i won't! i promise.", "c"],
		["t", "your friend says otherwise~", "j2"],
		["t", "take all of it!!! gooo ghostcat!", "p"],
		["t", "pompkin no!!!!!", "c"],
		["t", "don't take all the candy >:( no candy for you!", "j2"],
		["t", "no.... :(", "c"],
		["t", "you should've taken it all!!!! you deserve it!!!", "p"],
		["t", "that's not how this works, pompkin! :(", "c"],
		["t", "....... :(", "p"]
		
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
	4:[
		["t", "hey!! there's a candy here!", "c"],
		["t", "told ya!!!!!", "p"],
		["t", "omg!!!!", "c"],
		["t", "...", "c"],
		["t", "... you knew this already, didn't you?", "c"],
		["t", "did you put it here?", "c"],
		["t", ".......... maybe?", "p"],
		["t", "aw.....", "c"],
		["t", "idk...", "p"],
		["t", "i figured none of them would give you candy", "p"],
		["t", "so here's one that i spent 5 days searching for!", "p"],
		["t", "five days? wow... that's a lot.", "c"],
		["t", "this halloween is gonna be great!", "p"],
		["t", "thank you for making my dream come true, pompkin.", "c"],
		["t", "np!!!! i'll always have your back!!!", "p"],
		["t", "yea, you'll always sit on my back :)", "c"],
		["t", "yea!!!!!", "p"],
		["t", "oh, also this candy is like. pure sugar candy. you won't die eating it!!", "p"],
		["t", "aaaa that's great! thank you so much...", "c"],
		["t", "now eat it! and we can go chase kids for more!", "p"],
		["t", "pompkin no!!!!!!!!", "c"]
	]
}

signal click_next

onready var text = $text
onready var base = get_node("/root/base")

onready var knocksound  = $knock
onready var doorsound = $dooropen
onready var typingsound = $typing

var colors = {
	"c": "#000000",
	"n": "#000000",
	"p": "#ECAA53",
	"j": "#74586C",
	"j2": "#74586C",
	"l": "#61995D",
}

var names = {
	"c": "ghostcat",
	"n": "(note",
	"p": "pompkin",
	"j": "old person",
	"j2": "witchy kid",
	"l": "plant",
}

# Called when the node enters the scene tree for the first time.
func _ready():
	typingsound.playing = true
	typingsound.stream_paused = true
	visible = false

func play(num):
	visible = false
	text.text = ""
	text.percent_visible = 0
	if num in [1, 2, 3]:
		yield(text_loop("all"), "completed")
		base.anim.play_backwards("fade")
		#yield(base.anim, "animation_finished")
		
	yield(text_loop(num), "completed")
				
	visible = false
	if typeof(num) == TYPE_INT:
		if num == 4:
			base.end_game()
		else:
			base.stop_cutscene()
	else:
		base.stop_cutscene()

	
func text_loop(num):
	for i in lines[num]:
		if i[0] == "s":
			if i[1] == "door_knock":
				knocksound.playing = true
				yield(knocksound, "finished")
			elif i[1] == "door_open":
				doorsound.playing = true
				yield(doorsound, "finished")
				
		
		elif i[0] == "t":
			visible = true
			text.percent_visible = 0
			text.text = names[i[2]] + ": " + i[1]
			text.modulate = colors[i[2]]
			
			var seconds = 0.02 * text.get_total_character_count()
			$Tween.interpolate_property(text, "percent_visible", 0, 1, seconds, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
			$Tween.start()
			typingsound.stream_paused = false
			
			yield($Tween, "tween_completed")
			typingsound.stream_paused = true
			yield(self, "click_next")
			
	yield(get_tree(), "idle_frame")
	return

	


func _input(event):
	if event.is_action_pressed("interact"):
		emit_signal("click_next")
