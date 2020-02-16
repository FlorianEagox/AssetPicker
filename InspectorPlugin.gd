extends EditorInspectorPlugin

func can_handle(object: Object) -> bool:
	print("Editing: " + str(object))
	return true

func parse_property(object: Object, type: int, path: String, hint: int, hint_text: String, usage: int) -> bool:
	print(str(type), " " + path, " " + str(usage))
	return false