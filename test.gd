extends Node2D

func _ready():
	var compltex_array = [1,2,3,4,5,6,7,8]
#	print(compltex_array.slice(0,1))
#	print(compltex_array.slice(2,3))
#	print(compltex_array.slice(4,5))
#	print(compltex_array.slice(6,7))
#	var a = ArrayUtils.split_array(compltex_array,2)
#	print(a)
#	var a = compltex_array.slice(0,5,2)
#	print(a)
	#var aa = split_array(compltex_array,3)
	#print(aa[0])
	pass
	
func split_array(array:Array, step:int) -> Array:
	var index = 0
	var begin = 0
	var end = 1
	var result = []
	for element in array:
		if index == 0:
			var each = array.slice(0,1,1)
			result.append(each)
		elif index != 0:
			begin += step
			end += step
			var each = array.slice(begin,end,1)
			result.append(each)
			print(index)
			if index == step*2-1: #3 
				break
		index += 1
	print(result,len(result))
	return result
