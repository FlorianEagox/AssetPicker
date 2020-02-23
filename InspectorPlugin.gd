class_name InspectorPlugin extends EditorInspectorPlugin

# This plugin is applicable to all objects
func can_handle(object: Object) -> bool: return true

func parse_property(object: Object, type: int, path: String, hint: int, hint_text: String, usage: int) -> bool: # This goes through every inspector property
	if type == TYPE_OBJECT: # If we're editing a proerpty that can import a file
		add_property_editor(path, AssetChooser.new(object, path))
		# return true # Remove the original inspector property
	return false # Don't remove none applicable properties