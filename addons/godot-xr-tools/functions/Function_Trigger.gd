extends Area

# Array of objects in our trigger area
var objects_in_area = Array()

# Handler for controller button_pressed signal
func _on_button_pressed(p_button):
	# Find the closest trigger-object to the controller
	var target = _closest_object()
	
	# If we found a closest trigger-object then trigger it
	if target:
		target.trigger(p_button)

func _ready():
	# Subscribe to the controllers button_pressed signal
	get_parent().connect("button_pressed", self, "_on_button_pressed")

func _on_Function_Trigger_entered(object):
	# Add trigger-object to our array
	if object.has_method('trigger') and objects_in_area.find(object) == -1:
		objects_in_area.push_back(object)

func _on_Function_Trigger_exited(object):
	# Remove trigger-object from our array
	if objects_in_area.find(object) != -1:
		objects_in_area.erase(object)

func _closest_object():
	# Find closest object
	var closest_obj = null
	var closest_distance2 = 1000
	for o in objects_in_area:
		var delta_pos = o.global_transform.origin - global_transform.origin
		var distance2 = delta_pos.length_squared()
		if distance2 < closest_distance2:
			closest_obj = o
			closest_distance2 = distance2
	
	# Return closest object or null
	return closest_obj
