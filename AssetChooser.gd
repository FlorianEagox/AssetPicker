class_name AssetChooser extends EditorProperty

var list

func _init(object, path) -> void:
	list = OptionButton.new()
	add_child(list)
	list.connect("pressed", self, "_opened")	


func _opened():
	list.clear()
	for file in parse_dir():
		list.add_item(file)


func parse_dir(path_append = "", extensions = [], files = []):
	var dir = Directory.new()
	if path_append:
		dir.open(path_append)
	dir.list_dir_begin(true, true)
	var current = dir.get_next()
	while current:
		if not current.begins_with(".") and not current == "addons" and not current.ends_with(".import"):
			if dir.current_is_dir():
				parse_dir(dir.get_current_dir() + current, extensions, files)
			else:
				files.append(current)
		current = dir.get_next()
	dir.list_dir_end()
	return files
