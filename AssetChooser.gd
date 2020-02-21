class_name AssetChooser extends EditorProperty

func _init() -> void:
	var btnLoad = Button.new()
	btnLoad.text = "Load"
	add_child(btnLoad)