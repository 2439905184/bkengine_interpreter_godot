extends Node2D

# 只需要实现了中间标记码的解析运行 就能实现跨平台 使用不同后端的游戏引擎运行bkengine的代码
enum action_type {macro ,parser}
var current_action_type

var line_index = 0
#var lines = ["@sprite","param:index","value:128","param:file","value:icon.png","macro_end:true"]
var lines = ["@sprite","param:index","value:128","param:file","value:icon.png","macro_end:true","@sprite","param:index","value:123","param:file","value:icon.png","macro_end:true"]
#	var currentCommand = ""
var machineCode = {
	"command":"",
	"params": []
	}
var to_execute = []
var is_at_end = false
var peeked = []
var stored_sprite = []
# 仅解释并运行宏
func _ready():
	var built = load("res://builtin_macro.gd").new()
	for line in lines:
#		print(line)
		if line[0] == "@":
			var macro_name = line
			match macro_name:
				"@sprite": #可变参数，但是至少要有2个参数 index和file
					machineCode["command"] = macro_name
					while peek_next() != "macro_end:true":
						if lines[line_index] == "macro_end:true":
							break
					print("上层循环")
					print("peeked ",peeked)
					# 取参数
					var tmp = []
					for element in peeked:
						if element != "=" and element[0] != "@":
							# 原型
#							var machine_params = {"name":"","value"}
							var sp = element.split(":")
							var tp = sp[1]
							tmp.append(tp)
					# 转化为字典 由于遍历的问题，所以要以每2个一组进行分割
#					print(tmp)
#					print(lenk(tmp))
					var result = ArrayUtils.split_array_2(tmp)
					print("构造结果 ", result , len(result))
					var machine_params = {}
					for element in result:
						machine_params["name"] = element[0]
						machine_params["value"] = element[1]
						machineCode["params"].append(machine_params)
					# 解释执行
					for element in machineCode["params"]:
#						print_debug(element["name"])
#						print_debug(element["value"])
						interpeter(macro_name,element)
#						to_execute.append(machineCode)
					# 解释并运行代码
					var sprite = Sprite.new()
#					sprite.z_index = machineCode["params"]["value"]
					stored_sprite.append(sprite)
#		line_index += 1
#	print("机器码",to_execute)
	print(stored_sprite)
	pass
	 
func is_at_end() -> bool:
	if line_index >= len(lines):
		return true
	else:
		return false
	pass
	
# 探测下一行内容并返回
func peek_next() -> String:
	var fun_next = ""
	if line_index < 11:
		var next_index = line_index + 1
		var next = lines[next_index]
		fun_next = next
		line_index += 1
		if next != "macro_end:true":
			peeked.append(next)
	return fun_next

func read_next() -> String:
	var fun_next = ""
	if line_index < len(lines):
		line_index -= 1
		fun_next = lines[line_index]
		print(line_index,fun_next)
	return fun_next
	
#	while next != "=":
#		var sp_next = next.split(":")
#		# 判断是参数还是参数值
#		if sp_next[0] == "param":
#			var param_name = sp_next[1]
#			machine_params["name"] = param_name
#			if sp_next[0] == "value":
#				print("value")
#				var param_value = sp_next[1]
#				print_debug(param_value)
#				machine_params["value"] = param_value
#				machineCode["params"].append(machine_params)
#			elif next == "=":pass
#			elif next == "@":pass
# 解释器
func interpeter(p_macro, p_params):
	if p_macro == "@sprite":
		var sprite = Sprite.new()
		if p_params["name"] == "file":
			sprite.texture = load(p_params["value"])
			stored_sprite.append(sprite)
			print(sprite.texture)
			# 将中心点设置在左上角
			sprite.centered = false
			# 伪代码,添加到场景树
			$basic_layer.add_child(sprite)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	pass
