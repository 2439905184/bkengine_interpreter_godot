extends Object
class_name ArrayUtils

static func split_array(array:Array, step:int) -> Array:
	var output = [] # [1,2,3,4]
	for i in range(0, len(array), step):
		var each = array.slice(i,i + step)
		output.append(each)
	return output
	pass
# 按每两个一组分割
static func split_array_2(array) -> Array:
	var index = 0
	var step = 2
	var begin = 0
	var end = 1
	var n = len(array)
	var result = []
	for element in array:
		if index == 0:
			var each = array.slice(0,1,1)
			result.append(each)
		else:
#			print("索引",index)
			begin += 2
			end += 2
			if index == 2:
				break
			else:
				var each = array.slice(begin,end,1)
				result.append(each)
		index += 1
#	print(result,len(result))
	return result
	
func _run():
	# 测试代码
#	var compltex_array = [1,2,3,4,5,6,7,8,9,10]
#	var step = 1
#	var output = []
#	for i in range(0, len(compltex_array), step):
#		var each = compltex_array.slice(i,i + step)
#		output.append(each)
#		pass
#	print(output)

	
	pass

