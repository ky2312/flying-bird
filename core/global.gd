extends Node

var current_level_index: int = 0
var levels: Array[LevelResource] = []

var current_level: LevelResource:
	get():
		if current_level_index >= len(levels):
			return null
		return levels[current_level_index]
	set(v):
		var i = levels.find(v)
		if i == -1:
			printerr("设置的值错误")
		else:
			current_level_index = i
