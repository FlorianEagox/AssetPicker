tool
extends EditorPlugin

var plugin

func _enter_tree() -> void:
	var pluginReference: Resource = preload("InspectorPlugin.gd")
	plugin = pluginReference.new()
	add_inspector_plugin(plugin)


func _exit_tree() -> void:
	remove_inspector_plugin(plugin)
	plugin = null
