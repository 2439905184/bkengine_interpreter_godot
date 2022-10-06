tool
extends Node

var builtin_sprite_macros = ["@sprite", "@addto" , "@layer", "@remove" ,"@removeall", "@info", "@infoex", "@anchor", "@zorder", "@spriteopt", "@l2dsprite", "@particle", "@particleopt"]
const basic_layer = -1
const message_layer = -2

var builtin_audio_macros = ["@bgm", "@se", "@voice", "@stop", "@volume", "@pause", "@resume", "@fade"]
const bgm = -1
const voice = -2

var builtin_anim_macros = ["@animate"]

var builtin_text_macros = ["@text", "@textcursor", "@textwindow", "@textoff", "@texton", "@textspeed" ,"@textstyle", "@texttag", "@textsprite", "@locate", "@i" , "@b", "@s", "@u", "@r", "@l","@p","@er","@ruby", "@messagelayer", "@storefont", "@restorefont"]

var action_macros = ["@action"]

var logic_macros = ["@eval", "@jump", "@call", "@return", "@returnto", "@if", "@else", "@elseif", "@endif", "@tablegoto", "@for", "@continue", "@break", "@next"]

var wait_macros = ["@wait", "@waitaction", "@waitallaction", "@waitbutton", "@waitbgm", "@waitfade", "@waittrans", "@waitallaction","@waitse", "@waitvoice", "@waituntil", "@stopaction", "@stopallaction", "@stoptrans", "@stoopalltrans", "@cancelaction", "@cancelallaction","@click"]

var ui_macros = ["@button", "@buttonex", "@slider", "@sliderex", "@checkbox", "@checkboxex", "@inputbox", "@inputboxex", "@link", "@endlink"]

var trans_macros = ["@pretrans", "@trans"]

var effect_macros = ["@effect"]

var misc_macros = ["@event", "@deleteevent", "@sendevent", "@sendsystemevent", "@group", "endgroup", "@quit", "@idlesp", "@history" , "@fileexist", "@savepoint", "@save", "@load","@screenshot","@savetoimage","@macro","@import","@cursor","@watcher","@stopwatcher"]

var all_macros = []

func sprite(index,file,rect):
	var sprite = Sprite.new()
#	sprite.texture = load("res://bkscr/"+file)
	sprite.region_rect = rect
	return sprite
	
#var layer_consts = [""]
func init_macros():
	for i in builtin_sprite_macros:
		all_macros.append(i)
		
	for i in builtin_anim_macros:
		all_macros.append(i)
		
	for i in action_macros:
		all_macros.append(i)
		
	for i in logic_macros:
		all_macros.append(i)
		
	for i in wait_macros:
		all_macros.append(i)
		
	for i in ui_macros:
		all_macros.append(i)
		
	for i in trans_macros:
		all_macros.append(i)
		
	for i in effect_macros:
		all_macros.append(i)
		
	for i in misc_macros:
		all_macros.append(i)
		
	pass
func _ready():
	var s = Sprite.new()
	match s.get_class():
		"Sprite":
			print("执行")
#	print(s.get_class())
#	match typeof(s):
#		TYPE_ARRAY
	pass
