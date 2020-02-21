tool
extends EditorPlugin
var plugin
var btnDebug
func _enter_tree() -> void:
	btnDebug = Button.new()
	get_editor_interface().get_inspector().connect("mouse_exited", self, "debug_inspector")
	btnDebug.connect("pressed", self, "debug_inspector")
	plugin = InspectorPlugin.new()
	add_inspector_plugin(plugin)

	add_control_to_container(CONTAINER_TOOLBAR, btnDebug)

func _exit_tree() -> void:
	remove_inspector_plugin(plugin)
	plugin = null
	remove_control_from_container(CONTAINER_TOOLBAR, btnDebug)

func debug_inspector():
	print_children_readable(get_editor_interface().get_inspector())
	


# This function is very useful for parsing actual Editor elements
func print_children_readable(child: Control, level: int = 0):
	if child and child.visible:
		var tabs = ""
		for i in range(level):
			tabs += "\t"
		if child is BaseButton or child is Label:
			print(tabs, child, " | " + child.get_tooltip() if child.get_tooltip() else "")
			print(tabs, child.text)
			print(tabs, child.get_path())
		for sub_child in child.get_children():
			print_children_readable(sub_child, level+1)